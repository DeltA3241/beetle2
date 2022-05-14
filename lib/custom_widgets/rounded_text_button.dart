import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class TextButtonRoundedEdges extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const TextButtonRoundedEdges({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: kForumCardDecoration.copyWith(
            borderRadius: BorderRadius.circular(20),
            color: kBeetleMainColor,
          ),
          child: Center(
            child: Text(text!),
          ),
        ),
      ),
    );
  }
}
