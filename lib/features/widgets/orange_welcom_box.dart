import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class OrangeWelcomeBox extends StatelessWidget {
  final String text;
  final double ratio;
  final String boldText;
  final bool? isRegistrationScreen;
  const OrangeWelcomeBox({
    super.key,
    required this.text,
    required this.ratio,
    required this.boldText,
    this.isRegistrationScreen,
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
            if (isRegistrationScreen != null)
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.background,
                  )),
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
