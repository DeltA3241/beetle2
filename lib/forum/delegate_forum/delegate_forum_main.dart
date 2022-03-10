import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/search_bar.dart';

class DelegateForumMain extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: kpaddingSearchBar,
      child: SearchBar(
        label: 'Search Post / پوسٹ تلاش کریں',
        icon: Icons.search,
        onChanged: (value) {},
      ),
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
