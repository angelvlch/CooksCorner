import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/material.dart';

class ResultsCard extends StatelessWidget {
  const ResultsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.restaurant),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Restaurant'),
          Text('View',
              style: AppFonts.s14w400.copyWith(color: AppColors.orange)),
        ],
      ),

      trailing: IconButton(
          // padding: EdgeInsets.only(right: 30),
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_right_alt_outlined,
            color: AppColors.orange,
          )),
      //     subtitle: Text('Chefs'),
    );
  }
}
