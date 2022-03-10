import 'package:flutter/material.dart';

import 'package:beetle/utilities/constants.dart';

class FloatingRoundIconButton extends StatelessWidget {
  const FloatingRoundIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: kBeetleMainColor,
        child: Icon(
          icon,
          size: 45,
          color: Colors.orange[200],
        ),
        shape: const CircleBorder(),
        constraints: kSizeConstraintsFloatingButton,
      ),
    );
  }
}
