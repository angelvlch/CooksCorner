import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class OrangeWelcomeBox extends StatelessWidget {
  final String text;
  final double ratio;
  final String boldText;
  const OrangeWelcomeBox({
    super.key,
    required this.text,
    required this.ratio,
    required this.boldText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColors.orange,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: AppSize.s20),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / ratio,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: text,
                style: AppFonts.s25w300.copyWith(color: AppColors.background),
                children: <TextSpan>[
                  TextSpan(
                    text: boldText,
                    style:
                        AppFonts.s25w500.copyWith(color: AppColors.background),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
