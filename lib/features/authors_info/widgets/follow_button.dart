import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FollowButton extends StatelessWidget {
  final Function() tap;
  final bool isFollow;
  const FollowButton({super.key, required this.tap, required this.isFollow});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: isFollow ? AppColors.background : AppColors.orange,
      ),
      onPressed: tap,
      child: Text(isFollow ? 'Followed' : 'Follow',
          style: AppFonts.s14w400.copyWith(color: AppColors.background)),
    );
  }
}
