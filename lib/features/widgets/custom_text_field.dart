import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color backgroundColor;

  final String? errorMessage;
  final void Function(String) onChanged;
  final bool isValid;

  final bool isObcsure;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    this.isValid = true,
    required this.hintText,
    this.backgroundColor = AppColors.inputFieldBackground,
    this.isObcsure = false,
    this.suffixIcon,
    this.errorMessage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: isObcsure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.radius),
          borderSide: isValid
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
        errorText: isValid ? null : 'Пароли не совпадают',
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
