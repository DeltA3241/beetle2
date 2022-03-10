import 'dart:io';

import 'package:beetle/custom_widgets/round_icon_button.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../custom_widgets/image_picker_tile_bottomsheet.dart';

class DiseaseDetectionMain extends StatefulWidget {
  const DiseaseDetectionMain({Key? key}) : super(key: key);

  @override
  State<DiseaseDetectionMain> createState() => _DiseaseDetectionMainState();
}

class _DiseaseDetectionMainState extends State<DiseaseDetectionMain> {
  XFile? image;
  Widget option(image) {
    return image == null
        ? const Icon(
            Icons.add_a_photo_outlined,
            color: kBeetleMainColor,
            size: 200,
          )
        : Image.file(
            File(image!.path),
            fit: BoxFit.contain,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: DottedBorder(
              color: kBeetleMainColor,
              radius: const Radius.circular(20),
              borderType: BorderType.RRect,
              strokeWidth: 2,
              dashPattern: const [4, 5],
              child: Container(
                decoration: kForumCardDecoration,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RoundIconButton(
                      onPressed: () {},
                      icon: 'assets/images/png_files/wheat.png',
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: 'assets/images/png_files/wheat.png',
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: 'assets/images/png_files/wheat.png',
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: 'assets/images/png_files/wheat.png',
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: 'assets/images/png_files/wheat.png',
                    ),
                    RoundIconButton(
                      onPressed: () {},
                      icon: 'assets/images/png_files/wheat.png',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: GestureDetector(
              onTap: () async {
                var source =
                    await ImagePickerTileBottomSheet.showSheetAndGetChoice(
                        context);
                if (source != null) {
                  final ImagePicker _picker = ImagePicker();
                  image = await _picker.pickImage(source: source);
                  setState(
                    () {
                      option(image);
                    },
                  );
                }
              },
              child: DottedBorder(
                color: kBeetleMainColor,
                radius: const Radius.circular(20),
                borderType: BorderType.RRect,
                strokeWidth: 2,
                dashPattern: const [4, 5],
                child: Container(
                  width: double.infinity,
                  decoration: kForumCardDecoration,
                  child: Center(
                    child: option(image),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
