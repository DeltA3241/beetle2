import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String label;
  final TextEditingController? textEditingController;
  final void Function(String value)? onChanged;
  final IconData? icon;
  const SearchBar({
    this.textEditingController,
    required this.onChanged,
    required this.label,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(30),
        ),
        //labelStyle: const TextStyle(color: Colors.orange),
        constraints: BoxConstraints.loose(
          const Size(double.infinity, 50),
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
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
