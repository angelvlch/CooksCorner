import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Chicken'),
            Text('1 kg'),
          ],
        ),
        SizedBox(height: 9),
        Divider(
          thickness: 1,
          color: AppColors.inputFieldBackground,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
