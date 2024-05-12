import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:cooks_corner/core/constants/app_texts.dart';
import 'package:cooks_corner/features/widgets/custom_text_field.dart';
import 'package:cooks_corner/features/widgets/navigation_text.dart';
import 'package:cooks_corner/features/widgets/orange_welcom_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const OrangeWelcomeBox(
              text: AppTexts.authText,
              boldText: AppTexts.authBoldText,
              ratio: 3.6,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 23),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gmail',
                    style: AppFonts.s16w500.copyWith(color: AppColors.orange),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(AppImages.email),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: AppSize.s16),
                  Text(
                    'Password',
                    style: AppFonts.s16w500.copyWith(color: AppColors.orange),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    suffixIcon: _createSuffixIcon,
                    isObcsure: !isVisible,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: Container(
                        width: double.infinity, child: const Text('ffff')),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              child: const NavigationText(
                clickableText: 'Sign Up Now',
                unclickableText: 'I don’t have an account? ',
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton get _createSuffixIcon {
    return IconButton(
      icon: isVisible
          ? SvgPicture.asset(AppImages.visibilityOn)
          : SvgPicture.asset(AppImages.visibilityOff),
      onPressed: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
    );
  }
}
