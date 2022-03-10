import 'package:beetle/forum/forum_post.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';

class ForumCard extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final String title;
  final String description;
  final String imageIsAvailable;
  final String forumId;

  const ForumCard({
    required this.description,
    required this.title,
    this.onLongPress,
    this.onTap,
    required this.imageIsAvailable,
    required this.forumId,
    Key? key,
  }) : super(key: key);

  Widget imageAttached(String imageIsAvailable) {
    if (imageIsAvailable != 'none') {
      return const Expanded(
        flex: 1,
        child: Image(
          image: kBeetleFullLogo,
          fit: BoxFit.contain,
        ),
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
                title: title,
                description: description,
                forumContent: forumContents,
              ),
            ),
          );
        },
        onLongPress: onLongPress,
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
