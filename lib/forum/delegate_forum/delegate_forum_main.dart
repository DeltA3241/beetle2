import 'package:beetle/custom_widgets/rounded_text_button.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/search_bar.dart';

class DelegateForumMain extends SliverPersistentHeaderDelegate {
  void Function(String value)? onChanged;
  void Function()? onPressed;
  String? text;
  DelegateForumMain({
    required this.onChanged,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: kpaddingSearchBar,
              child: SearchBar(
                label: 'Search Post / پوسٹ تلاش کریں',
                icon: Icons.search,
                onChanged: onChanged,
              ),
            ),
          ),
          TextButtonRoundedEdges(
            onPressed: onPressed,
            text: text,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 10;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
