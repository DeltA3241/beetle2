import 'package:http/http.dart' as http;
import 'package:beetle/forum/custom_widgets/comment_card.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_post.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../utilities/beetle_networking.dart';

// ignore: must_be_immutable
class ForumPost extends StatelessWidget {
  final dynamic forumContent;
  final String title;
  final String description;
  final String forumId;
  late String text;
  ForumPost({
    Key? key,
    required this.forumId,
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
                          authorId: forumContent['comments'][index]
                              ['creator_id'],
                          comment: forumContent['comments'][index]['text'],
                          email: forumContent['comments'][index]
                              ['creator_name'],
                          imageIsAvailable: forumContent['comments'][index]
                              ['image'],
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
                //right: 10,
                top: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SearchBar(
                      label: 'send text',
                      icon: Icons.message_outlined,
                      onChanged: (value) {
                        text = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        Map<String, String> commentData = {
                          'text': text,
                        };
                        // commentData.removeWhere(
                        //     (key, value) => value == ' ' || value == null);
                        http.Response response = await BeetleNetworking()
                            .addComment(commentData, forumId);
                        if (response.statusCode == 201) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
