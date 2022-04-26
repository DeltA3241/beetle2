import 'dart:convert';
import 'dart:typed_data';

import 'package:beetle/custom_widgets/image_picker_tile_bottomsheet.dart';
import 'package:beetle/globals.dart' as global;
import 'package:beetle/forum/forum_post.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class ForumCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageIsAvailable;
  final String forumId;
  final int authorId;
  final int tagIndex;
  const ForumCard({
    required this.authorId,
    required this.tagIndex,
    required this.description,
    required this.title,
    required this.imageIsAvailable,
    required this.forumId,
    Key? key,
  }) : super(key: key);
  @override
  State<ForumCard> createState() => _ForumCardState();
}

class _ForumCardState extends State<ForumCard> {
  Uint8List image = Uint8List(0);
  void setImageParam() async {
    image = (await rootBundle.load(kBeetleImagePath)).buffer.asUint8List();
  }

  Widget imageAttached(String imageIsAvailable, int tagIndex) {
    if (imageIsAvailable != 'None') {
      return FutureBuilder<dynamic>(
        future: BeetleNetworking().getImage(imageIsAvailable),
        builder: (context, image) {
          // ignore: prefer_typing_uninitialized_variables
          var widget;
          if (image.hasData) {
            this.image = base64Decode(
              image.data['image'],
            );
            widget = Expanded(
              flex: 1,
              child: Hero(
                tag: 'imageForum$tagIndex',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    this.image,
                    fit: BoxFit.cover,
                    cacheHeight: 400,
                    cacheWidth: 400,
                  ),
                ),
              ),
            );
          } else {
            widget = const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
          return widget;
        },
      );
    } else {
      setImageParam();
      return const SizedBox(
        width: 2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (image.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              kPleaseWaitImageMessage,
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForumPost(
                  tagIndex: widget.tagIndex,
                  imageForum: image,
                  forumId: widget.forumId,
                  title: widget.title,
                  description: widget.description,
                ),
              ),
            );
          }
        },
        onLongPress: () {
          global.userId == widget.authorId
              ? showModalBottomSheet(
                  backgroundColor: const Color(0x00ffffff),
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(10),
                      decoration: kForumCardDecoration,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImagePickerTileBottomSheet(
                            text: 'Delete Forum',
                            icon: Icons.delete_outline,
                            onTap: () async {
                              Response response =
                                  await BeetleNetworking().deleteForum(
                                widget.forumId,
                              );
                              if (response.statusCode == 200) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                          const SizedBox(
                            child: Divider(color: Colors.black),
                          ),
                          ImagePickerTileBottomSheet(
                            text: 'Update Forum',
                            icon: Icons.error_outline,
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                )
              : showModalBottomSheet(
                  backgroundColor: const Color(0x00ffffff),
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(10),
                      decoration: kForumCardDecoration,
                      child: ImagePickerTileBottomSheet(
                        text: 'Report Forum',
                        icon: Icons.error_outline,
                        onTap: () async {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            kPleaseWait,
                          );
                          await BeetleNetworking().report(
                            widget.forumId,
                          );
                        },
                      ),
                    );
                  },
                );
        },
        child: Material(
          shadowColor: Colors.grey,
          elevation: 20,
          borderRadius: kBorderRadiusForumCards,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 200,
            width: double.infinity,
            decoration: kForumCardDecoration,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        widget.title,
                        style: kForumTitleTextStyle,
                      ),
                      Flexible(
                        child: Text(widget.description),
                      )
                    ],
                  ),
                ),
                imageAttached(widget.imageIsAvailable, widget.tagIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
