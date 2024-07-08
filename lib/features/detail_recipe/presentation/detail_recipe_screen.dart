import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
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
                height: MediaQuery.sizeOf(context).height * 570 / 852,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NAME', style: AppFonts.s22w500),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
