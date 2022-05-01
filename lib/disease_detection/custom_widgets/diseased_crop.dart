import 'dart:io';

import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class DiseasedCrop extends StatelessWidget {
  final XFile? image;
  final dynamic diseaseDetails;
  const DiseasedCrop({
    Key? key,
    required this.diseaseDetails,
    required this.image,
  }) : super(key: key);

  List<Widget> createWidgets() {
    List<Widget> response = [];

    response.add(
      UrduTextWidget(
        title: ':علامات\n',
        description: diseaseDetails['disease_details']['symptoms'][0],
      ),
    );
    response.add(
      UrduTextWidget(
        title: ': نامیاتی کو کنٹرول کریں\n',
        description: diseaseDetails['disease_details']['control_organic'],
      ),
    );
    response.add(
      UrduTextWidget(
        title: ':سائنسی نام\n',
        description: diseaseDetails['disease_details']['pest_scientific_name'],
      ),
    );
    response.add(
      Align(
        alignment: Alignment.centerRight,
        child: RichText(
          textAlign: TextAlign.end,
          text: const TextSpan(
            text: ': کنٹرول مصنوعات',
            style: kDiseaseTitleTextStyle,
          ),
        ),
      ),
    );
    for (String products in diseaseDetails['disease_details']
        ['control_products']) {
      response.add(
        Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Lottie.asset(
                  kProductBag,
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                products,
                style: kDiseaseDescriptionTextStyle,
              ),
            ],
          ),
        ),
      );
    }
    response.add(
      Align(
        alignment: Alignment.centerRight,
        child: RichText(
          textAlign: TextAlign.end,
          text: const TextSpan(
            text: ': علاج کی دوا',
            style: kDiseaseTitleTextStyle,
          ),
        ),
      ),
    );
    for (String med in diseaseDetails['disease_details']['control_chemicals']) {
      response.add(
        Card(
          child: Row(
            children: [
              Lottie.asset(
                kDisinfectantSpray,
                width: 50,
                height: 50,
              ),
              Text(
                med,
                style: kDiseaseDescriptionTextStyle,
              ),
            ],
          ),
        ),
      );
    }
    return response;
  }

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
            children: createWidgets(),
          ),
        )
      ],
    );
  }
}

class UrduTextWidget extends StatelessWidget {
  final String title;
  final String description;
  const UrduTextWidget({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
          text: title,
          style: kDiseaseTitleTextStyle,
          children: <TextSpan>[
            TextSpan(
              text: description,
              style: kDiseaseDescriptionTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
