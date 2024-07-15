import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final Map level;
  final int selectedIndex;
  final Function() onTap;
  const LevelButton({
    super.key,
    required this.level,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith((states) {
          if (selectedIndex != level['id']) {
            return AppColors.text;
          } else {
            return AppColors.background;
          }
        }),
        elevation: const MaterialStatePropertyAll(0),
        textStyle: MaterialStateProperty.all(TextStyle()),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((_) {
          if (selectedIndex != level['id']) {
            return AppColors.inputFieldBackground;
          }
          return AppColors.orange;
        }),
      ),
      onPressed: onTap,
      child: Text(
        level['name'],
      ),
    );
  }
}
