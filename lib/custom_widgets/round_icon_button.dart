import 'package:flutter/material.dart';

import 'package:beetle/utilities/constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  final void Function() onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: Colors.orangeAccent,
        child: CircleAvatar(
          backgroundImage: AssetImage(icon),
          backgroundColor: Colors.orangeAccent,
          radius: 45,
        ),
        shape: const CircleBorder(),
        constraints: kSizeConstraints,
      ),
    );
  }
}
