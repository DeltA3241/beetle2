import 'dart:convert';

import 'package:beetle/custom_widgets/image_picker_tile_bottomsheet.dart';
import 'package:beetle/globals.dart' as global;
import 'package:beetle/forum/forum_post.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';

class ForumCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageIsAvailable;
  final String forumId;
  final int authorId;

  const ForumCard({
    required this.authorId,
    required this.description,
    required this.title,
    required this.imageIsAvailable,
    required this.forumId,
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
        onTap: () async {
          dynamic forumContents =
              await BeetleNetworking.getForumComents(forumId);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForumPost(
                forumId: forumId,
                title: title,
                description: description,
                forumContent: forumContents,
              ),
            ),
          );
        },
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
                            text: 'Delete Forum',
                            icon: Icons.delete_outline,
                            onTap: () {},
                          ),
                          const SizedBox(
                            child: Divider(color: Colors.black),
                          ),
                          ImagePickerTileBottomSheet(
                            text: 'Report Forum',
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
                        onTap: () {},
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
            padding: const EdgeInsets.all(30),
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
                        title,
                        style: kForumTitleTextStyle,
                      ),
                      Flexible(
                        child: Text(description + '\n' + forumId),
                      )
                    ],
                  ),
                ),
                imageAttached(imageIsAvailable),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
