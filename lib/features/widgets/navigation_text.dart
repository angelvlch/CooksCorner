import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String unclickableText;
  final String clickableText;
  final VoidCallback? onTap;

  const NavigationText({
    super.key,
    required this.unclickableText,
    required this.clickableText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppFonts.s12w400.copyWith(color: AppColors.text),
        children: <TextSpan>[
          TextSpan(text: unclickableText),
          TextSpan(
              text: clickableText,
              style: const TextStyle(color: AppColors.orange),
              recognizer: TapGestureRecognizer()..onTap = onTap),
        ],
      ),
    );
  }
}
