import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:cooks_corner/core/constants/app_texts.dart';
import 'package:cooks_corner/core/routes/route.dart';
import 'package:cooks_corner/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:cooks_corner/features/widgets/custom_button.dart';
import 'package:cooks_corner/features/widgets/custom_text_field.dart';
import 'package:cooks_corner/features/widgets/navigation_text.dart';
import 'package:cooks_corner/features/widgets/orange_welcom_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isVisible = false;
  bool isRePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          /*  if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: ${state.errorMessage}')),
            );
          } */
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const OrangeWelcomeBox(
                  text: AppTexts.registrationText,
                  ratio: 3.9,
                  boldText: AppTexts.registrationBoldText,
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
                        style:
                            AppFonts.s16w500.copyWith(color: AppColors.orange),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        onChanged: (value) => context
                            .read<RegistrationBloc>()
                            .add(NameChanged(name: value)),
                        hintText: 'Enter your name',
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(AppImages.person),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Gmail',
                        style:
                            AppFonts.s16w500.copyWith(color: AppColors.orange),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        onChanged: (value) => context
                            .read<RegistrationBloc>()
                            .add(EmailChanged(email: value)),
                        hintText: 'Enter your email',
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(AppImages.email),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Password',
                        style:
                            AppFonts.s16w500.copyWith(color: AppColors.orange),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        onChanged: (value) => context
                            .read<RegistrationBloc>()
                            .add(PasswordChanged(password: value)),
                        hintText: 'Enter your password',
                        suffixIcon: _createSuffixIcon,
                        isObcsure: !isVisible,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Re-Password',
                        style:
                            AppFonts.s16w500.copyWith(color: AppColors.orange),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        isValid: state.model.isPasswordTheSame(),
                        onChanged: (value) => context
                            .read<RegistrationBloc>()
                            .add(RePassworChanged(rePassword: value)),
                        hintText: 'Re-Enter your password',
                        suffixIcon: _createSuffixIconRePassword,
                        isObcsure: !isRePasswordVisible,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: AppTexts.signUp,
                        onTap: state.model.isValidForRegistration
                            ? () {
                                context
                                    .read<RegistrationBloc>()
                                    .add(SubmitData());
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: NavigationText(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, Routes.authorization, (route) => false),
                    clickableText: 'Sign In Now',
                    unclickableText: 'Already have an account?  ',
                  ),
                ),
              ],
            ),
          );
        },
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
