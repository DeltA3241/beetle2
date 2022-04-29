import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utilities/constants.dart';

class HealthyCrop extends StatelessWidget {
  const HealthyCrop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Crop is Healthy.',
          textDirection: TextDirection.ltr,
          softWrap: true,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Lottie.asset(
          kHealthyPlant,
        ),
        const Text(
          'آپ کی فصل صحت مند ہے۔',
          textDirection: TextDirection.rtl,
          softWrap: true,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
