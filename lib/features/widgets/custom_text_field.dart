import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color backgroundColor;
  final bool isPasswordTheSame;
  final String? errorMessage;
  final void Function(String) onChanged;

  final bool isObcsure;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.backgroundColor = AppColors.inputFieldBackground,
    this.isObcsure = false,
    this.suffixIcon,
    this.isPasswordTheSame = true,
    this.errorMessage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: isObcsure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: isPasswordTheSame
              ? BorderSide.none
              : const BorderSide(
                  color: AppColors.red,
                  width: 2.0,
                ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: const BorderSide(color: AppColors.red, width: 2.0),
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        fillColor: backgroundColor,
        filled: true,
        errorText: isPasswordTheSame ? null : 'Пароли не совпадают',
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
