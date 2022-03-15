import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  final String label;
  final TextEditingController? textEditingController;
  final void Function(String value)? onChanged;
  final IconData? icon;
  const DescriptionTextField({
    this.textEditingController,
    required this.onChanged,
    required this.label,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 20,
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(30),
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 50,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
        constraints: BoxConstraints.tight(
          const Size(double.infinity, 200),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.orange,
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        focusColor: Colors.orange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
