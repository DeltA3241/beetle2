import 'package:beetle/utilities/beetle_networking.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DiseaseResponse extends StatefulWidget {
  final Map<String, String> details;
  const DiseaseResponse({
    Key? key,
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
          String text = '';
          if (details.hasData) {
            text = details.data.toString();
          }
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
                        child: Text(text),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  decoration: kForumCardDecoration.copyWith(
                    color: kBeetleMainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: kForumCardDecoration,
                          child: const Center(
                            child: Text('Post to Forum'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: kForumCardDecoration,
                          child: const Center(
                            child: Text('Show Products'),
                          ),
                        ),
                      )
                    ],
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
