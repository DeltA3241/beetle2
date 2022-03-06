import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

class DelegateForumPost extends SliverPersistentHeaderDelegate {
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
          const Positioned(
            left: 5,
            top: 5,
            child: Text(
              'Title',
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
                image: NetworkImage(
                    'https://rodaleinstitute.org/wp-content/uploads/IMG_5386-1200x800.jpg'),
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
              child: Container(
                width: 350,
                child: const Text(
                  'kegabfkghsfalha oiuawehfioahf hiouehfaiohfioauwhef ahrefoihaae heaiohf aefhoiu',
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
