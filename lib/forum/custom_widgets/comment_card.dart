import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:beetle/globals.dart' as global;
import '../../custom_widgets/image_picker_tile_bottomsheet.dart';
import '../../utilities/beetle_networking.dart';

class CommentCard extends StatelessWidget {
  final String email;
  final String comment;
  final String imageIsAvailable;
  final int authorId;

  const CommentCard({
    required this.comment,
    required this.email,
    required this.imageIsAvailable,
    required this.authorId,
    Key? key,
  }) : super(key: key);

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
              child: CircularProgressIndicator(color: Colors.red),
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
                        email,
                        style: kForumTitleTextStyle,
                      ),
                      SizedBox(
                        child: Text(comment),
                      )
                    ],
                  ),
                ),
                imageAttached(imageIsAvailable),
              ],
            ),
          ),
        ),
        onLongPress: () {
          global.userId == authorId
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
                            text: 'Delete Comment',
                            icon: Icons.delete_outline,
                            onTap: () {},
                          ),
                          const SizedBox(
                            child: Divider(color: Colors.black),
                          ),
                          ImagePickerTileBottomSheet(
                            text: 'Update Comment',
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
