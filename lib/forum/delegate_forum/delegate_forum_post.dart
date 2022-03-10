import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

class DelegateForumPost extends SliverPersistentHeaderDelegate {
  final String title;
  final String description;
  DelegateForumPost({
    required this.title,
    required this.description,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: kForumCardDecoration,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 5,
            top: 5,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: kForumTitleTextStyle,
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            child: AnimatedOpacity(
              duration: const Duration(microseconds: 500),
              opacity: 1 - shrinkOffset / maxExtent,
              child: const Image(
                image: kBeetleFullLogo,
                fit: BoxFit.contain,
                width: 350,
                height: 300,
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 5,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1 - shrinkOffset / maxExtent,
              child: SizedBox(
                width: 350,
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ],
      ),
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
