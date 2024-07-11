import 'package:cooks_corner/core/constants/app_colors.dart';
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
        //  maximumSize: Size(double.infinity, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: AppColors.orange,
      ),
      onPressed: tap,
      child: Text(isFollow ? 'Follow' : 'Followed'),
    );
  }
}
