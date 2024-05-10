import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:cooks_corner/core/constants/app_texts.dart';
import 'package:cooks_corner/features/widgets/custom_text_field.dart';
import 'package:cooks_corner/features/widgets/orange_welcom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  bool isVisible = false;
  bool isRePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OrangeWelcomeBox(
              text: AppTexts.registrationText,
              ratio: 3.6,
              boldText: AppTexts.registrationBoldText,
              isRegistrationScreen: true,
            ),
            const SizedBox(height: AppSize.s20),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: AppFonts.s16w500.copyWith(color: AppColors.orange),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(AppImages.person),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: AppSize.s16),
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
                  const SizedBox(height: AppSize.s16),
                  Text(
                    'Re-Password',
                    style: AppFonts.s16w500.copyWith(color: AppColors.orange),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    controller: rePasswordController,
                    hintText: 'Re-Enter your password',
                    suffixIcon: _createSuffixIconRePassword,
                    isObcsure: !isRePasswordVisible,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton get _createSuffixIconRePassword {
    return IconButton(
      icon: isRePasswordVisible
          ? SvgPicture.asset(AppImages.visibilityOn)
          : SvgPicture.asset(AppImages.visibilityOff),
      onPressed: () {
        setState(() {
          isRePasswordVisible = !isRePasswordVisible;
        });
      },
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
