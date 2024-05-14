import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? iconPath;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textFaded;
          }
          return AppColors.orange;
        }),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null) SvgPicture.asset(iconPath!),
          Text(text,
              style: AppFonts.s14w500.copyWith(color: AppColors.background)),
        ],
      ),
    );
  }
}
