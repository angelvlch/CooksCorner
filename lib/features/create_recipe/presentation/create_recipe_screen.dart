import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/features/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create recipe',
          style: AppFonts.s20w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add a recipe photo',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              SizedBox(height: 16),
              Text(
                'Name your recipe',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              SizedBox(height: 4),
              CustomTextField(
                onChanged: (_) {},
                hintText: 'Name',
              ),
              SizedBox(height: 16),
              Text(
                'Add a description',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              SizedBox(height: 4),
              CustomTextField(
                onChanged: (_) {},
                hintText: 'Description',
              ),
              SizedBox(height: 16),
              Text(
                'Add an ingredient',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onChanged: (_) {},
                      hintText: 'Ingredient name',
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: AppColors.textFaded,
                    ),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
