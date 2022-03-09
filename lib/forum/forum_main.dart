import 'package:beetle/forum/delegate_forum/delegate_forum_main.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/forum_card.dart';

class ForumMain extends StatefulWidget {
  const ForumMain({Key? key}) : super(key: key);

  @override
  State<ForumMain> createState() => _ForumMainState();
}

class _ForumMainState extends State<ForumMain> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: BeetleNetworking().getForums(),
        builder: (context, forums) {
          // ignore: prefer_typing_uninitialized_variables
          var sliverList;
          if (forums.hasData) {
            sliverList = SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ForumCard(
                    title: forums.data[index]['title'],
                    imageIsAvailable: true,
                    description: forums.data[index]['description'] +
                        '\n' +
                        forums.data[index]['id'],
                  );
                },
                childCount: forums.data.length,
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
                floating: true,
                pinned: false,
                delegate: DelegateForumMain(),
              ),
              sliverList,
            ],
          );
        });
  }
}
