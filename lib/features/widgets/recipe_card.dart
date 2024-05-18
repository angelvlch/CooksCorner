import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/1070/ad91/9fab35f5cea96371d4e9e5cff3474762?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZiO-r2hgkUjNQNcWVRsPfys72C80kSC~4FlRzdgnlT0UaTpE3ePGt2kECIwf4dBgm19t1teZ3aroo1joTi4nJ9MciLqmin8NApmHnuYV7cCzvZYj~0eB6XhCN--9CAOiO1PgbMdoRzetK1xg2eofUtXdwedHQBwWgo-uIC~6SXfBHRhfMvPMXYPI04-1-iMf6J9OH6WQE9HHdsTmbkfoTRwSjlJkaMxrJOmXrawssl4GjaIBMHxf5~GVvecJyHy9TnSBeSCEzhTLO20cenIoIWCviMcWlspioP8KY2MqvDROFw6v7XwIk4AFVa~ahCKThAohcaS5SCgcl9MONqHrOQ__',
      placeholder: (context, url) => const CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment(0, 0.5),
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Noname',
                      style: AppFonts.s16w500
                          .copyWith(color: AppColors.background),
                    ),
                    Text(
                      'Noname',
                      style: AppFonts.s10w400
                          .copyWith(color: AppColors.background),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.like,
                          color: AppColors.background,
                          height: 10.92,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '100',
                          style: AppFonts.s12w400
                              .copyWith(color: AppColors.background),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          AppImages.save,
                          color: AppColors.background,
                          height: 10.92,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '200',
                          style: AppFonts.s12w400
                              .copyWith(color: AppColors.background),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
