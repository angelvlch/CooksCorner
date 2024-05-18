import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/features/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iconFaded,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: 15,
              itemBuilder: (context, index) => const RecipeCard(),
            ),
          ],
        ),
      ),
    );
  }
}
