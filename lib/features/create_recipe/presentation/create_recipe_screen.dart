import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/features/create_recipe/presentation/widgets/level_button.dart';
import 'package:cooks_corner/features/widgets/custom_button.dart';
import 'package:cooks_corner/features/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final List<String> _categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
  ];
  String dropDownCategory = 'Breakfast';
  int _selectedIndex = 0;
  List<String> _measures = [
    'kg',
    'sp',
    'g',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'kg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create recipe',
          style: AppFonts.s20w500,
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
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
              const SizedBox(height: 4),
              _uploadPhoto(),
              const SizedBox(height: 16),
              Text(
                'Name your recipe',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                onChanged: (_) {},
                hintText: 'Name',
              ),
              const SizedBox(height: 16),
              Text(
                'Add a description',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                onChanged: (_) {},
                hintText: 'Description',
              ),
              const SizedBox(height: 16),
              Text(
                'Add an ingredient',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onChanged: (_) {},
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: CustomTextField(
                      hintText: '0',
                      onChanged: (_) {},
                      suffixIcon: _createDropButton(),
                    ),
                  ),
                  IconButton(
                    iconSize: 44,
                    padding: EdgeInsetsDirectional.zero,
                    icon: const Icon(
                      Icons.add_circle,
                      color: AppColors.orange,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Difficulty',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: 4),
              _createRowButton(),
              const SizedBox(height: 16),
              Text(
                'Category of meal',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: '',
                onChanged: (_) {},
                suffixIcon: _createDropCategories(),
              ),
              const SizedBox(height: 16),
              Text(
                'Preparation time',
                style: AppFonts.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'How much time does it need?(minutes)',
                onChanged: (_) {},
              ),
              SizedBox(height: 92),
              CustomButton(
                text: 'Create a recipe',
                onTap: null,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _uploadPhoto() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.inputFieldBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.camera),
          SizedBox(width: 10),
          Text(
            'Upload a final photo of your dish',
            style: AppFonts.s14w400.copyWith(color: AppColors.iconFaded),
          ),
        ],
      ),
    );
  }

  Widget _createDropButton() {
    return SizedBox(
      width: 90,
      child: DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        padding: const EdgeInsets.only(right: 20),
        // elevation: 10,
        decoration: const InputDecoration(enabled: false),
        value: dropdownvalue,
        onChanged: (value) {
          setState(() {
            dropdownvalue = value!;
          });
        },
        items: _measures.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items,
                style: AppFonts.s14w400.copyWith(color: AppColors.textFaded)),
          );
        }).toList(),
      ),
    );
  }

  Widget _createRowButton() {
    List<Map> difficulties = [
      {'id': 0, 'name': 'Easy'},
      {'id': 1, 'name': 'Medium'},
      {'id': 2, 'name': 'Hard'}
    ];

    return Row(
      children: [
        LevelButton(
            level: difficulties[0],
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = difficulties[0]['id'];
              });
            }),
        const SizedBox(width: 8),
        LevelButton(
            level: difficulties[1],
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = difficulties[1]['id'];
              });
            }),
        const SizedBox(width: 8),
        LevelButton(
            level: difficulties[2],
            selectedIndex: _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = difficulties[2]['id'];
              });
            }),
      ],
    );
  }

  Widget _createDropCategories() {
    return DropdownButtonFormField(
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const InputDecoration(enabled: false),
      value: dropDownCategory,
      onChanged: (value) {
        setState(() {
          dropDownCategory = value!;
        });
      },
      items: _categories.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items,
              style: AppFonts.s14w400.copyWith(color: AppColors.textFaded)),
        );
      }).toList(),
    );
  }
}
