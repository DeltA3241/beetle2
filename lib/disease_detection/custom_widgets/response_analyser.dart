import 'package:beetle/disease_detection/custom_widgets/diseased_crop.dart';
import 'package:flutter/material.dart';
import 'healthy_crop.dart';

class ResponseAnalyser extends StatefulWidget {
  final dynamic diseaseDetails;
  const ResponseAnalyser({
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
        diseaseDetails: widget.diseaseDetails,
      );
    }
  }
}
