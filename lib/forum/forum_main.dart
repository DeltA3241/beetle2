import 'package:beetle/forum/new_forum.dart';
import 'package:beetle/custom_widgets/floating_round_icon_button.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_main.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'custom_widgets/forum_card.dart';

class ForumMain extends StatefulWidget {
  const ForumMain({Key? key}) : super(key: key);

  @override
  State<ForumMain> createState() => _ForumMainState();
}

class _ForumMainState extends State<ForumMain> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder<dynamic>(
          future: BeetleNetworking().getForums('?search=$search'),
          builder: (context, forums) {
            // ignore: prefer_typing_uninitialized_variables
            var sliverList;
            if (forums.hasData) {
              sliverList = SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    search = '';
                    return ForumCard(
                      tagIndex: index,
                      authorId: forums.data[index]['author_id'],
                      title: forums.data[index]['title'],
                      imageIsAvailable: forums.data[index]['image'],
                      description: forums.data[index]['description'],
                      forumId: forums.data[index]['id'],
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
                  delegate: DelegateForumMain(
                    onPressed: () {
                      setState(
                        () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      );
                    },
                    onChanged: (value) {
                      search = value;
                    },
                  ),
                ),
                sliverList,
              ],
            );
          },
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: FloatingRoundIconButton(
            icon: Icons.add,
            onPressed: () {
              showMaterialModalBottomSheet(
                backgroundColor: const Color(0x00c7bab9),
                context: context,
                builder: (context) {
                  return const NewForum();
                },
              ).then((value) => setState(() {}));
            },
          ),
        )
      ],
    );
  }
}
