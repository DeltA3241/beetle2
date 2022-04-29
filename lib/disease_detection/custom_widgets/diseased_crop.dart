import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';

class DiseasedCrop extends StatelessWidget {
  final dynamic diseaseDetails;
  const DiseasedCrop({Key? key, required this.diseaseDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: 'Prediction:\n',
                  style: kDiseaseTitleTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: diseaseDetails['prediction'],
                      style: kDiseaseDescriptionTextStyle,
                    ),
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              textAlign: TextAlign.end,
              text: TextSpan(
                text: ':پیشن گوئی\n',
                style: kDiseaseTitleTextStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: diseaseDetails['disease_details']['disease_name'] +
                        '\n',
                    style: kDiseaseDescriptionTextStyle,
                  ),
                  TextSpan(
                    text: diseaseDetails['disease_details']['pest_name'],
                    style: kDiseaseDescriptionTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
