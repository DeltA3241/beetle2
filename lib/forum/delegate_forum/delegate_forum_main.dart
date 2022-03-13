import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/search_bar.dart';

class DelegateForumMain extends SliverPersistentHeaderDelegate {
  void Function(String value)? onChanged;
  void Function()? onPressed;
  DelegateForumMain({
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 7,
          child: Padding(
            padding: kpaddingSearchBar,
            child: SearchBar(
              label: 'Search Post / پوسٹ تلاش کریں',
              icon: Icons.search,
              onChanged: onChanged,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.search,
                color: kBeetleMainColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 10;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
