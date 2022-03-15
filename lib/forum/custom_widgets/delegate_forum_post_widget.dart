import 'dart:typed_data';

import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

class DelegateForumPostWidget extends StatefulWidget {
  const DelegateForumPostWidget({
    Key? key,
    required this.title,
    required this.maxExtent,
    required this.tagIndex,
    required this.imageForum,
    required this.description,
    required this.shrinkOffset,
  }) : super(key: key);

  final String title;
  final double maxExtent;
  final int tagIndex;
  final Uint8List imageForum;
  final String description;
  final double shrinkOffset;

  @override
  State<DelegateForumPostWidget> createState() =>
      _DelegateForumPostWidgetState();
}

class _DelegateForumPostWidgetState extends State<DelegateForumPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: kForumCardDecoration,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            left: 5,
            top: 5,
            child: Text(
              widget.title,
              textAlign: TextAlign.start,
              style: kForumTitleTextStyle,
            ),
          ),
          Positioned(
            top: 25,
            left: 5,
            child: AnimatedOpacity(
              duration: const Duration(microseconds: 500),
              opacity: 1 - widget.shrinkOffset / widget.maxExtent,
              child: Hero(
                tag: 'imageForum${widget.tagIndex}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: MemoryImage(widget.imageForum),
                    fit: BoxFit.cover,
                    width: 0.8 * MediaQuery.of(context).size.width,
                    height: 0.8 * MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.87 * MediaQuery.of(context).size.width,
            left: 5,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1 - widget.shrinkOffset / widget.maxExtent,
              child: SizedBox(
                width: 0.8 * MediaQuery.of(context).size.width,
                child: Text(
                  widget.description,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
