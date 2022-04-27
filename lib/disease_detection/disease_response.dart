import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:lottie/lottie.dart';
import '../custom_widgets/rounded_text_button.dart';
import '../forum/new_forum.dart';

class DiseaseResponse extends StatefulWidget {
  final Map<String, String> details;
  final XFile? image;
  const DiseaseResponse({
    Key? key,
    required this.image,
    required this.details,
  }) : super(key: key);

  @override
  State<DiseaseResponse> createState() => _DiseaseResponseState();
}

class _DiseaseResponseState extends State<DiseaseResponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: FutureBuilder<dynamic>(
        future: BeetleNetworking().getDetails(widget.details),
        builder: (context, details) {
          Widget widgetToshow = details.hasData
              ? Text(
                  details.data.toString(),
                )
              : Lottie.asset(
                  kWalkingPlant,
                );
          return Column(
            children: [
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DottedBorder(
                    color: kBeetleMainColor,
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    strokeWidth: 2,
                    dashPattern: const [4, 5],
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: kForumCardDecoration,
                      child: Center(
                        child: widgetToshow,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: DottedBorder(
                    color: kBeetleMainColor,
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    strokeWidth: 2,
                    dashPattern: const [4, 5],
                    child: Container(
                      decoration: kForumCardDecoration.copyWith(
                        color: Colors.orangeAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButtonRoundedEdges(
                            onPressed: () {
                              showMaterialModalBottomSheet(
                                backgroundColor: const Color(0x00c7bab9),
                                context: context,
                                builder: (context) {
                                  TextEditingController title =
                                      TextEditingController();
                                  title.text = "hello";
                                  TextEditingController description =
                                      TextEditingController();
                                  description.text = "world";
                                  return NewForum(
                                    image: widget.image,
                                    titleController: title,
                                    descriptionController: description,
                                  );
                                },
                              );
                            },
                            text: 'Post on Forum',
                          ),
                          TextButtonRoundedEdges(
                            onPressed: () {},
                            text: 'Show Products',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
