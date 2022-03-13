import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:beetle/forum/custom_widgets/comment_card.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_post.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

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
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: SafeArea(
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
                        child: CircularProgressIndicator(color: Colors.orange),
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
                        FocusScope.of(context).requestFocus(FocusNode());
                        Map<String, String> commentData = {
                          'text': text,
                        };
                        // commentData.removeWhere(
                        //     (key, value) => value == ' ' || value == null);
                        http.Response response = await BeetleNetworking()
                            .addComment(commentData, widget.forumId);
                        if (response.statusCode == 201) {
                          setState(
                            () {},
                          );
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
