import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailRecipeScreen extends StatefulWidget {
  const DetailRecipeScreen({super.key});

  @override
  State<DetailRecipeScreen> createState() => _DetailRecipeScreenState();
}

class _DetailRecipeScreenState extends State<DetailRecipeScreen> {
  bool isFavorite = false;
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.sizeOf(context).height * 300 / 852,
            //  width: ,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            /*               imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
            ), */
            errorWidget: (context, url, error) => Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 158, 158)),
            ),
            imageUrl:
                'https://s3-alpha-sig.figma.com/img/60a8/fb40/0136c54edf4e723f8270242c7c79b16c?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kwMWg4-fZRuq55dTmEt8eta5xoX-oymzMStFmhJ213ZJZUzfiN1Hw1LQs~S100nGIxS~3Zg5oiLFo2kkXgQ~b7GszvAG0iAXaaFKLBe4iskO9Sg0Uv4wqFx5ECQtY846QNVSKlprA2kE6pkswnc68mbJyLyEiZM6gu9Y0OJIrIAhrPodUlvuiLghJYGGi35AGH7T~kIZOHjN21iYw4voMDTslxGQXgdcCjp02GOxBWyhUbg4tPNAaQA1kqhBow9AF4Pp~u-7wlmCWZYCP6TdWAIx42WTiG9D89W5H9t6IeyzUk0lJip683CJwYY7~flMEIAkE~fgQXMCB~2wPHLIKw__',
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
              height: MediaQuery.sizeOf(context).height * 585 / 852,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(36),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  //padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 206 / 393,
                        child: const Text(
                          'Ainsley’s Jerk Chicken',
                          style: AppFonts.s22w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _createCookingTime(),
                      const SizedBox(height: 12),
                      _createDifficultyLevel(),
                      const SizedBox(height: 12),
                      Text('by Ainsley Harriott',
                          style: AppFonts.s12w400
                              .copyWith(color: AppColors.textFaded)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _createLikeButton(),
                          _createSaveButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCookingTime() {
    return Row(
      children: [
        SvgPicture.asset(AppImages.cookingTime),
        const SizedBox(
          width: 10,
        ),
        Text(
          '20-30 min',
          style: AppFonts.s14w400.copyWith(color: AppColors.orange),
        ),
      ],
    );
  }

  Widget _createDifficultyLevel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
          color: AppColors.orange, borderRadius: BorderRadius.circular(20)),
      child: Text('Easy', style: AppFonts.s12w400),
    );
  }

  Widget _createLikeButton() {
    return Row(
      children: [
        IconButton(
          splashRadius: 1,
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: SvgPicture.asset(
              isFavorite ? AppImages.fillLike : AppImages.emptyLike),
        ),
        Text('12 likes', style: AppFonts.s12w400)
      ],
    );
  }

  Widget _createSaveButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
      icon:
          SvgPicture.asset(isSaved ? AppImages.fillSave : AppImages.emptySave),
    );
  }
}
