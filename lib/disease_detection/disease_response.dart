import 'package:beetle/utilities/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DiseaseResponse extends StatefulWidget {
  final String responseBody;
  const DiseaseResponse({Key? key, required this.responseBody})
      : super(key: key);

  @override
  State<DiseaseResponse> createState() => _DiseaseResponseState();
}

class _DiseaseResponseState extends State<DiseaseResponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kBeetleAppBar,
      body: Padding(
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
            child: Text(widget.responseBody),
          ),
        ),
      ),
    );
  }
}
