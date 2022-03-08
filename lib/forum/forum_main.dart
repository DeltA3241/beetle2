import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_main.dart';
import 'package:beetle/utilities/constants.dart';
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
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: DelegateForumMain(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const ForumCard(
                title: 'Title/عنوان',
                imageIsAvailable: true,
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
