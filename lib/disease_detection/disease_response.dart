import 'package:beetle/disease_detection/custom_widgets/response_analyser.dart';
import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:beetle/utilities/crop_details.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:lottie/lottie.dart';
import '../custom_widgets/rounded_text_button.dart';
import '../ecommerce/Providers/product_provider.dart';
import '../forum/new_forum.dart';
import 'custom_widgets/products_screen.dart';
import 'package:provider/provider.dart';

class DiseaseResponse extends StatefulWidget {
  final Map<String, String> details;
  final XFile? image;
  final String crop;
  const DiseaseResponse({
    Key? key,
    required this.crop,
    required this.image,
    required this.details,
  }) : super(key: key);

  @override
  State<DiseaseResponse> createState() => _DiseaseResponseState();
}

class _DiseaseResponseState extends State<DiseaseResponse> {
  TextEditingController title = TextEditingController();
  CropDetails cropDetails = CropDetails();
  TextEditingController description = TextEditingController();
  late final dynamic response;

  @override
  void initState() {
    super.initState();
    response = BeetleNetworking().getDetails(widget.details);
  }

  @override
  Widget build(BuildContext context) {
    bool showProducts = false;
    final products1 = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: kBeetleAppBar,
      body: FutureBuilder<dynamic>(
        future: response,
        builder: (context, details) {
          if (details.hasData) {
            if (details.data['prediction'] != 'Healthy') {
              showProducts = details.data['items_found'];
              title.text = cropDetails.getTitle(widget.crop);
              description.text = cropDetails.getDeatils(
                widget.crop,
                details.data['prediction'],
                details.data['disease_details']['symptoms'][0],
              );
              products1.addProduct(details.data['items']);
            }
          }
          Widget widgetToshow = details.hasData
              ? ResponseAnalyser(
                  image: widget.image,
                  diseaseDetails: details.data,
                )
              : Center(
                  child: Lottie.asset(
                    kWalkingPlant,
                  ),
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
                      width: double.infinity,
                      decoration: kForumCardDecoration,
                      child: widgetToshow,
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
                          Visibility(
                            visible: showProducts,
                            child: TextButtonRoundedEdges(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const Product1(),
                                  ),
                                );
                              },
                              text: 'Show Products',
                            ),
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
