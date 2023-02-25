import 'package:flutter/material.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/core/validation_extensions.dart';

class InputForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String?)? validation;

  const InputForm({Key? key, required this.hint, required this.controller, this.validation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent)),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          color: AppColors.base.withOpacity(0.7),
        ),
      ),
    );
  }
}
