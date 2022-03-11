import 'dart:convert';
import 'dart:io';

import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../custom_widgets/image_picker_tile_bottomsheet.dart';
import '../utilities/beetle_networking.dart';
import 'custom_widgets/search_bar.dart';

class NewForum extends StatefulWidget {
  const NewForum({Key? key}) : super(key: key);

  @override
  State<NewForum> createState() => _NewForumState();
}

class _NewForumState extends State<NewForum> {
  XFile? image;
  String title = ' ';
  String description = ' ';
  Widget option(image) {
    return image == null
        ? const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.black,
            size: 70,
          )
        : Image.file(
            File(image!.path),
            fit: BoxFit.contain,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 200,
        right: 30,
        left: 30,
      ),
      padding: const EdgeInsets.all(10),
      decoration: kForumCardDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBar(
            label: 'title',
            icon: Icons.menu,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          SearchBar(
            label: 'description',
            icon: Icons.message_outlined,
            onChanged: (value) {
              description = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: DottedBorder(
              color: kBeetleMainColor,
              radius: const Radius.circular(20),
              borderType: BorderType.RRect,
              strokeWidth: 2,
              dashPattern: const [4, 5],
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: kCommentCardDecoration,
                child: option(image),
              ),
            ),
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
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kBeetleMainColor,
            ),
            onPressed: () async {
              dynamic imageBytes;
              dynamic encodedImage;
              if (image == null) {
                encodedImage = null;
              } else {
                imageBytes = await image!.readAsBytes();
                encodedImage = base64Encode(imageBytes);
              }

              Map<String, dynamic> forumDetails = {
                'title': title,
                'description': description,
                'image': encodedImage,
                'comments': [],
              };
              forumDetails
                  .removeWhere((key, value) => value == ' ' || value == null);
              http.Response response =
                  await BeetleNetworking().createForum(forumDetails);
              if (response.statusCode == 201) {
                Navigator.pop(context);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.done_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
