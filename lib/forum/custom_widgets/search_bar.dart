import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String label;
  const SearchBar({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(30),
        ),
        //labelStyle: const TextStyle(color: Colors.orange),
        constraints: BoxConstraints.tight(
          const Size(double.infinity, 40),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.orange,
        ),
        labelText: label,
        focusColor: Colors.orange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
