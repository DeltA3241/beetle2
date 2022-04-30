import 'dart:io';

import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseasedCrop extends StatelessWidget {
  final XFile? image;
  final dynamic diseaseDetails;
  const DiseasedCrop({
    Key? key,
    required this.diseaseDetails,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(image!.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: ':پیشن گوئی\n',
                    style: kDiseaseTitleTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: diseaseDetails['disease_details']
                                ['disease_name'] +
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
            ),
          ],
        ),
        const SizedBox(
          height: 3,
          child: Divider(
            thickness: 2,
            color: kBeetleMainColor,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: ':علامات\n',
                    style: kDiseaseTitleTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: diseaseDetails['disease_details']['symptoms'][0],
                        style: kDiseaseDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: ': نامیاتی کو کنٹرول کریں\n',
                    style: kDiseaseTitleTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: diseaseDetails['disease_details']
                            ['control_organic'],
                        style: kDiseaseDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: ': علاج کی دوا\n',
                    style: kDiseaseTitleTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: diseaseDetails['disease_details']
                            ['control_chemicals'][0],
                        style: kDiseaseDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
