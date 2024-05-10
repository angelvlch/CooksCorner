import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color backgroundColor;

  // final  void Function(String) onChanged;

  final bool isObcsure;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.backgroundColor = AppColors.inputFieldBackground,
    this.isObcsure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObcsure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        fillColor: backgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: AppFonts.s14w400.copyWith(color: AppColors.textFaded),
      ),
    );
  }
}
