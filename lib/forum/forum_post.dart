import 'package:beetle/forum/custom_widgets/comment_card.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_post.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

class ForumPost extends StatelessWidget {
  final dynamic forumContent;
  final String title;
  final String description;
  const ForumPost({
    Key? key,
    required this.forumContent,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: false,
                    floating: true,
                    delegate: DelegateForumPost(
                      title: title,
                      description: description,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CommentCard(
                          comment: forumContent['comments'][index]['text'],
                          email: forumContent['comments'][index]['image'],
                          imageIsAvailable: true,
                        );
                      },
                      childCount: forumContent['comments'].length,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
                top: 10,
              ),
              child: SearchBar(
                label: 'send text',
                icon: Icons.message_outlined,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
