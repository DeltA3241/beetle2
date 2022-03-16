import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:beetle/custom_widgets/image_picker_tile_bottomsheet.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:beetle/forum/custom_widgets/comment_card.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_post.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:record/record.dart';
import '../utilities/beetle_networking.dart';

class ForumPost extends StatefulWidget {
  final int tagIndex;
  final String title;
  final String description;
  final String forumId;
  final Uint8List imageForum;
  const ForumPost({
    Key? key,
    required this.tagIndex,
    required this.imageForum,
    required this.forumId,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  State<ForumPost> createState() => _ForumPostState();
}

class _ForumPostState extends State<ForumPost> {
  late bool recordingPermission;
  @override
  void initState() {
    getPermission();
    super.initState();
  }

  void getPermission() async {
    recordingPermission = await record.hasPermission();
  }

  final record = Record();
  AudioPlayer audioPlayer = AudioPlayer();
  TextEditingController textEditingController = TextEditingController();
  String text = '';
  bool _progress = false;
  XFile? image;
  dynamic audioAsBytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _progress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FutureBuilder<dynamic>(
                  future: BeetleNetworking.getForumComents(widget.forumId),
                  builder: (context, comments) {
                    // ignore: prefer_typing_uninitialized_variables
                    var sliverList;
                    if (comments.hasData) {
                      sliverList = SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            dynamic comment = comments.data['comments'][index];
                            return CommentCard(
                              forumId: widget.forumId,
                              audioIsAvailable: comment['voice_note'],
                              commentId: comment['comment_id'],
                              authorId: comment['creator_id'],
                              comment: comment['text'],
                              userName: comment['creator_name'],
                              imageIsAvailable: comment['image'],
                            );
                          },
                          childCount: comments.data['comments'].length,
                        ),
                      );
                    } else {
                      sliverList = const SliverToBoxAdapter(
                        child: Center(
                          child:
                              CircularProgressIndicator(color: Colors.orange),
                        ),
                      );
                    }
                    return CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: false,
                          floating: true,
                          delegate: DelegateForumPost(
                            tagIndex: widget.tagIndex,
                            imageForum: widget.imageForum,
                            title: widget.title,
                            description: widget.description,
                          ),
                        ),
                        sliverList,
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 5,
                  right: 5,
                  top: 5,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SearchBar(
                        textEditingController: textEditingController,
                        label: 'Comment',
                        icon: Icons.message_outlined,
                        onChanged: (value) {
                          text = value;
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () async {
                          dynamic source = await ImagePickerTileBottomSheet
                              .showSheetAndGetChoice(
                            context,
                          );
                          if (source != null) {
                            final ImagePicker _picker = ImagePicker();
                            image = await _picker.pickImage(source: source);
                            if (image != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                kImageAddedSnackBar,
                              );
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onLongPressStart: (details) async {
                          HapticFeedback.heavyImpact();
                          if (recordingPermission) {
                            await record.start();
                          }
                        },
                        onLongPressUp: () async {
                          String? audio = await record.stop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            kVoiceAddedSnackBar,
                          );
                          audioAsBytes =
                              File(audio.toString()).readAsBytesSync();
                        },
                        onTap: () {
                          audioAsBytes = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            kVoiceremovedSnackBar,
                          );
                        },
                        child: const Icon(
                          Icons.mic_none_outlined,
                          size: 24,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () async {
                          dynamic imageBytes;
                          dynamic encodedImage;
                          if (image == null) {
                            encodedImage = null;
                          } else {
                            imageBytes = await image!.readAsBytes();
                            encodedImage = base64Encode(imageBytes);
                          }
                          dynamic encodedAudio;
                          if (audioAsBytes == null) {
                            encodedAudio = null;
                          } else {
                            encodedAudio = base64Encode(audioAsBytes);
                          }
                          setState(() {
                            _progress = true;
                          });
                          textEditingController.clear();
                          FocusScope.of(context).requestFocus(FocusNode());
                          Map<String, dynamic> commentData = {
                            'text': text,
                            'image': encodedImage,
                            'voice_note': encodedAudio,
                          };
                          commentData.removeWhere(
                              (key, value) => value == '' || value == null);
                          http.Response response = await BeetleNetworking()
                              .addComment(commentData, widget.forumId);
                          if (response.statusCode == 201) {
                            setState(
                              () {
                                _progress = false;
                                image = null;
                                audioAsBytes = null;
                              },
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
