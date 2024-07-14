import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.keyboardType,
      this.maxLength,
      this.controller});
  String? hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
