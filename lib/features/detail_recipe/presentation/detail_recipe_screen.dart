import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRecipeScreen extends StatefulWidget {
  const DetailRecipeScreen({super.key});

  @override
  State<DetailRecipeScreen> createState() => _DetailRecipeScreenState();
}

class _DetailRecipeScreenState extends State<DetailRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl:
                    'https://s3-alpha-sig.figma.com/img/1070/ad91/9fab35f5cea96371d4e9e5cff3474762?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZiO-r2hgkUjNQNcWVRsPfys72C80kSC~4FlRzdgnlT0UaTpE3ePGt2kECIwf4dBgm19t1teZ3aroo1joTi4nJ9MciLqmin8NApmHnuYV7cCzvZYj~0eB6XhCN--9CAOiO1PgbMdoRzetK1xg2eofUtXdwedHQBwWgo-uIC~6SXfBHRhfMvPMXYPI04-1-iMf6J9OH6WQE9HHdsTmbkfoTRwSjlJkaMxrJOmXrawssl4GjaIBMHxf5~GVvecJyHy9TnSBeSCEzhTLO20cenIoIWCviMcWlspioP8KY2MqvDROFw6v7XwIk4AFVa~ahCKThAohcaS5SCgcl9MONqHrOQ__'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  color: AppColors.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
