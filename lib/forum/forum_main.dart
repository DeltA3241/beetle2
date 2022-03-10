import 'dart:io';

import 'package:beetle/custom_widgets/floating_round_icon_button.dart';
import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/delegate_forum/delegate_forum_main.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../custom_widgets/image_picker_tile_bottomsheet.dart';
import 'custom_widgets/forum_card.dart';

class ForumMain extends StatefulWidget {
  const ForumMain({Key? key}) : super(key: key);

  @override
  State<ForumMain> createState() => _ForumMainState();
}

class _ForumMainState extends State<ForumMain> {
  XFile? image;
  Widget option(image) {
    return image == null
        ? const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.black,
            size: 70,
          )
        : Image.file(
            File(image!.path),
            fit: BoxFit.contain,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder<dynamic>(
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
                  delegate: DelegateForumMain(),
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
                backgroundColor: const Color(0x33c7bab9),
                context: context,
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 200,
                      right: 30,
                      left: 30,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: kForumCardDecoration,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchBar(
                          label: 'title',
                          icon: Icons.menu,
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchBar(
                          label: 'description',
                          icon: Icons.message_outlined,
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: DottedBorder(
                            color: kBeetleMainColor,
                            radius: const Radius.circular(20),
                            borderType: BorderType.RRect,
                            strokeWidth: 2,
                            dashPattern: const [4, 5],
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: kCommentCardDecoration,
                              child: option(image),
                            ),
                          ),
                          onTap: () async {
                            var source = await ImagePickerTileBottomSheet
                                .showSheetAndGetChoice(context);
                            if (source != null) {
                              final ImagePicker _picker = ImagePicker();
                              image = await _picker.pickImage(source: source);
                              setState(
                                () {
                                  option(image);
                                },
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kBeetleMainColor,
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.done_outlined,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
