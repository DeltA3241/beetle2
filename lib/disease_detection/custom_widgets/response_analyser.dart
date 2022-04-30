import 'package:beetle/disease_detection/custom_widgets/diseased_crop.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'healthy_crop.dart';

class ResponseAnalyser extends StatefulWidget {
  final XFile? image;
  final dynamic diseaseDetails;
  const ResponseAnalyser({
    required this.image,
    required this.diseaseDetails,
    Key? key,
  }) : super(key: key);

  @override
  State<ResponseAnalyser> createState() => _ResponseAnalyserState();
}

class _ResponseAnalyserState extends State<ResponseAnalyser> {
  @override
  Widget build(BuildContext context) {
    if (widget.diseaseDetails['prediction'] == 'Healthy') {
      return const HealthyCrop();
    } else {
      return DiseasedCrop(
        image: widget.image,
        diseaseDetails: widget.diseaseDetails,
      );
    }
  }
}
