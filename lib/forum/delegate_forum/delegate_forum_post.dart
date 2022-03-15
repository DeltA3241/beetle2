import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../custom_widgets/delegate_forum_post_widget.dart';

class DelegateForumPost extends SliverPersistentHeaderDelegate {
  final String title;
  final String description;
  final Uint8List imageForum;
  final int tagIndex;
  DelegateForumPost({
    required this.tagIndex,
    required this.imageForum,
    required this.title,
    required this.description,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DelegateForumPostWidget(
      title: title,
      maxExtent: maxExtent,
      tagIndex: tagIndex,
      imageForum: imageForum,
      description: description,
      shrinkOffset: shrinkOffset,
    );
  }

  @override
  double get maxExtent => 500;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
