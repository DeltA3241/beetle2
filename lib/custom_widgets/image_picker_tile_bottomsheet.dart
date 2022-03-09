import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ImagePickerTileBottomSheet extends StatelessWidget {
  const ImagePickerTileBottomSheet({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        tileColor: Colors.orange,
        title: Text(text),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }

  static Future<dynamic> showSheetAndGetChoice(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagePickerTileBottomSheet(
              text: 'Pick from gallery',
              icon: Icons.photo,
              onTap: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
            ),
            ImagePickerTileBottomSheet(
              text: 'Pick from Camera',
              icon: Icons.photo,
              onTap: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }
}
