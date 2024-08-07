/* import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/core/constants/app_sizes.dart';
import 'package:cooks_corner/core/constants/app_texts.dart';
import 'package:cooks_corner/core/routes/route.dart';
import 'package:cooks_corner/features/authorization/presentation/bloc/authorization_bloc.dart';
import 'package:cooks_corner/features/widgets/custom_button.dart';
import 'package:cooks_corner/features/widgets/custom_text_field.dart';
import 'package:cooks_corner/features/widgets/navigation_text.dart';
import 'package:cooks_corner/features/widgets/orange_welcom_box.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          if (state is AuthorizationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          } else if (state is AuthorizationSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.main, (route) => false,
                arguments: state.model.token);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const OrangeWelcomeBox(
                    text: AppTexts.authText,
                    boldText: AppTexts.authBoldText,
                    ratio: 3.9,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 24),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: AppFonts.s16w500
                              .copyWith(color: AppColors.orange),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.006),
                        CustomTextField(
                          onChanged: (value) =>
                              context.read<AuthorizationBloc>().add(
                                    NameChanged(name: value),
                                  ),
                          hintText: 'Enter your name',
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(AppImages.email),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: AppSize.s16),
                        Text(
                          'Password',
                          style: AppFonts.s16w500
                              .copyWith(color: AppColors.orange),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.006),
                        CustomTextField(
                          onChanged: (value) =>
                              context.read<AuthorizationBloc>().add(
                                    PasswordChanged(password: value),
                                  ),
                          hintText: 'Enter your password',
                          suffixIcon: _createSuffixIcon,
                          isObcsure: !isVisible,
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.018),
                        CustomButton(
                          text: AppTexts.signIn,
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context, Routes.main, (route) => false,
                              arguments:
                                  'f'), /* state.entity.isEntityValid()
                              ? () => context.read<AuthorizationBloc>().add(
                                    SubmitData(entity: state.entity),
                                  )
                              : null, */
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: NavigationText(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, Routes.registration, (route) => false),
                  clickableText: 'Sign Up Now',
                  unclickableText: 'I don’t have an account? ',
                ),
              ),
            ],
          );
        },
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
 */

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example of Image Picker in flutter'),
      ),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(
                File(_image!.path),
                scale: 1,
                semanticLabel: 'Hello',
                excludeFromSemantics: true,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}
