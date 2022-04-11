import 'dart:convert';
import 'dart:io';

import 'package:beetle/custom_widgets/floating_round_icon_button.dart';
import 'package:beetle/custom_widgets/round_icon_button.dart';
import 'package:beetle/disease_detection/disease_response.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../custom_widgets/image_picker_tile_bottomsheet.dart';

class DiseaseDetectionMain extends StatefulWidget {
  const DiseaseDetectionMain({Key? key}) : super(key: key);

  @override
  State<DiseaseDetectionMain> createState() => _DiseaseDetectionMainState();
}

class _DiseaseDetectionMainState extends State<DiseaseDetectionMain> {
  XFile? image;
  bool _progress = false;
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
    return ModalProgressHUD(
      inAsyncCall: _progress,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
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
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return RoundIconButton(
                            index: index,
                            onPressed: (index) {
                              print(index);
                            },
                            icon: 'assets/images/png_files/wheat.png',
                          );
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
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
                      var source = await ImagePickerTileBottomSheet
                          .showSheetAndGetChoice(context);
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
          ),
          Positioned(
            bottom: 5,
            right: 4,
            child: FloatingRoundIconButton(
                icon: Icons.check,
                onPressed: () async {
                  setState(() {
                    _progress = true;
                  });
                  // dynamic imageEncoded = await image!.readAsBytes();
                  // dynamic finalImage = base64Encode(imageEncoded);
                  // Map<String, dynamic> details = {
                  //   "crop": "pepper",
                  //   'image': finalImage,
                  // };

                  // Response response =
                  //     await BeetleNetworking().getDetails(details);
                  // if (response.statusCode == 200) {
                  //   dynamic x = jsonDecode(
                  //     utf8.decode(
                  //       response.bodyBytes,
                  //     ),
                  //   );
                  setState(() {
                    _progress = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DiseaseResponse(
                          responseBody: "x.toString()",
                        );
                      },
                    ),
                  );
                }
                //},
                ),
          )
        ],
      ),
    );
  }
}
