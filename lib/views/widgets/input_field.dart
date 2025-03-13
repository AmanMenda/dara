import 'package:dara/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:dara/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText,
    required this.validator,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
  });

  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: '●',
          autovalidateMode: autovalidateMode,
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, style: BorderStyle.none)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, style: BorderStyle.none)
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, style: BorderStyle.none)
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}