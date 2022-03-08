import 'package:flutter/material.dart';
import 'package:beetle/utilities/constants.dart';

class CommentCard extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final String email;
  final String comment;
  final bool imageIsAvailable;

  const CommentCard({
    required this.comment,
    required this.email,
    this.onLongPress,
    this.onTap,
    required this.imageIsAvailable,
    Key? key,
  }) : super(key: key);

  Widget imageAttached(bool imageIsAvailable) {
    if (imageIsAvailable) {
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
        onTap: onTap,
        onLongPress: onLongPress,
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
      ),
    );
  }
}
