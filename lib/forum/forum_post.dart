import 'package:beetle/forum/custom_widgets/forum_card.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum_post/delegate_forum_post.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({Key? key}) : super(key: key);

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
                    delegate: DelegateForumPost(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const ForumCard(
                            description: 'description',
                            title: 'title',
                            imageIsAvailable: false);
                      },
                      childCount: 10,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
                top: 10,
              ),
              child: SearchBar(label: 'send text'),
            ),
          ],
        ),
      ),
    );
  }
}
