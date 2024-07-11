import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/cupertino.dart';

class AuthorData extends StatelessWidget {
  final String data;
  final int count;

  const AuthorData({super.key, required this.data, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString(), style: AppFonts.s20w500),
        Text(
          data,
          style: AppFonts.s14w400.copyWith(color: AppColors.textFaded),
        ),
      ],
    );
  }
}
