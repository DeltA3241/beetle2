import 'package:beetle/forum/delegate_forum_post/delegate_forum_post.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: DelegateForumPost(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: DelegateForumPost(),
            ),
          ],
        ),
      ),
    );
  }
}
