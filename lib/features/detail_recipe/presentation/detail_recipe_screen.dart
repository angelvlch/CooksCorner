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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.sizeOf(context).height * 290 / 852,
              //  width: ,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
/*               imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
              ), */
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/60a8/fb40/0136c54edf4e723f8270242c7c79b16c?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MFzVzaUGFd2KsRN4WsmYw9Aq8lOB4b6IB~LaSZ1fnlnlB6LzqeMNgiV8mlnSMZQN6Vw5yMqbZk0PkD5rdN-~68dOQur~DNlPXu6tHVyigS1p16nLv36--pjqL6Ul2d8ORwbJthonufT8hnT8D5iibJzCO3NP2R5jg6bPzcKdtMd-T5~dfwx4IWxd~rlizY7Gr95dycoDz4IpEYbkhtvRVlqpU8OirZtqCjYDu8Y13nejznBoRS6wIPonS9T3KlSR9o026h8RBYUrCVxnk3tMxw9mirn2BRAIqlTkFG-DhSr~azx-PyiUmSlAKElJM9mxjqeM9IWFaORtpjOonk83fA__',
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.all(20),
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.background,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 570 / 852,
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(36)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
