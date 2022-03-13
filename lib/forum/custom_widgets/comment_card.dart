import 'dart:convert';

import 'package:beetle/forum/custom_widgets/update_delete_comment.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:beetle/globals.dart' as global;
import '../../custom_widgets/image_picker_tile_bottomsheet.dart';
import '../../utilities/beetle_networking.dart';

class CommentCard extends StatefulWidget {
  final String userName;
  final String comment;
  final String imageIsAvailable;
  final int authorId;
  final String commentId;
  final String forumId;

  const CommentCard({
    required this.commentId,
    required this.comment,
    required this.userName,
    required this.imageIsAvailable,
    required this.authorId,
    required this.forumId,
    Key? key,
  }) : super(key: key);
  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  Widget imageAttached(String imageIsAvailable) {
    if (imageIsAvailable != 'None') {
      return FutureBuilder<dynamic>(
        future: BeetleNetworking().getImage(imageIsAvailable),
        builder: (context, image) {
          // ignore: prefer_typing_uninitialized_variables
          var widget;
          if (image.hasData) {
            widget = Expanded(
              flex: 1,
              child: Image.memory(
                base64Decode(
                  image.data['image'],
                ),
              ),
            );
          } else {
            widget = const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }
          return widget;
        },
      );
    } else {
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
        child: Material(
          shadowColor: Colors.grey,
          elevation: 20,
          borderRadius: kBorderRadiusForumCards,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            decoration: kCommentCardDecoration,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        widget.userName,
                        style: kForumTitleTextStyle,
                      ),
                      SizedBox(
                        child: Text(widget.comment),
                      )
                    ],
                  ),
                ),
                imageAttached(widget.imageIsAvailable),
              ],
            ),
          ),
        ),
        onLongPress: () {
          global.userId == widget.authorId
              ? showModalBottomSheet(
                  backgroundColor: const Color(0x00ffffff),
                  context: context,
                  builder: (context) {
                    return UpdateDeleteComment(
                      commentId: widget.commentId,
                      comment: widget.comment,
                      userName: widget.userName,
                      forumId: widget.forumId,
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
                        text: 'Report Comment',
                        icon: Icons.error_outline,
                        onTap: () {},
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
