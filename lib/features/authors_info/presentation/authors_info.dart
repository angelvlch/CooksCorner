import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/features/authors_info/widgets/author_data.dart';
import 'package:cooks_corner/features/authors_info/widgets/follow_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorsInfo extends StatefulWidget {
  const AuthorsInfo({super.key});

  @override
  State<AuthorsInfo> createState() => _AuthorsInfoState();
}

class _AuthorsInfoState extends State<AuthorsInfo> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 70 / 393),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 55 / 393),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                      imageUrl:
                          'https://s3-alpha-sig.figma.com/img/6082/abd3/e767d5e1bfcfcf1b5f391d15bdbbc208?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gR7Q4nfBjj-u2UH2N2pYKIXvvPjpSefotJuhfhGokAyxxqyQ4KCmF4QLljWLoesyjJkxwpPwWhKqs8YsAR1l2e9FMXwSh0G-d4~zwP0WzO~gR0bnEw4r8gOODNQNhofTSFb0WvcWkLL6ksxrJeF6eJHJr-xuqRSEH~N0DpL14FaB8knSZrd9h5Xe~bpcu~COE-Ogdlk0QYEnSGh23hhMJR1rI27ylbJ8xLnVbs5Sgz87JZ6fwc7kqJAitwqGvXS91V-Y1sxjGEZN9hbITgC7oTfa02xHb3aAUS3Ab6vB3Xz6IKOkMjMyCLKfzeIAzpTpLC66cePq~BV0lf3QcubFKw__'),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Ainsley Harriott', style: AppFonts.s16w500),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AuthorData(data: 'Recipe', count: 144),
                    AuthorData(data: 'Followers', count: 24),
                    AuthorData(data: 'Following', count: 100),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _createAuthorDescription(),
              SizedBox(
                width: double.infinity,
                child: FollowButton(
                    tap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    isFollow: isFollow),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createAuthorDescription() {
    return Text(
      'Ainsley Denzil Dubriel Harriott MBE is an English chef and television presenter. He is known for his BBC cooking',
      style: AppFonts.s14w400.copyWith(color: AppColors.textFaded),
      textAlign: TextAlign.center,
    );
  }
}
