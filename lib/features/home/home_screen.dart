import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:cooks_corner/features/widgets/orange_welcom_box.dart';
import 'package:cooks_corner/features/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
/* 

class HomeScreen extends StatefulWidget {
  final String? token;
  const HomeScreen({super.key, required this.token});

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
 */

class HomeScreen extends StatefulWidget {
  final String? token;
  const HomeScreen({
    required this.token,
    Key? key,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Breakfast'),
    const Tab(text: 'Lunch'),
    const Tab(text: 'Dinner'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrangeWelcomeBox(
                text: 'Hi, ', ratio: 4, boldText: 'USERNAME'),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Category', style: AppFonts.s18w500),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: TabBar(
                dividerHeight: 0,
                indicatorWeight: 0,
                // padding: const EdgeInsets.only(left: 5),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicator: const UnderlineTabIndicator(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: AppColors.text,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 15.0),
                ),
                unselectedLabelColor: AppColors.textFaded,
                labelColor: AppColors.text,
                labelStyle: AppFonts.s14w500,
                controller: _tabController,
                tabs: myTabs
                    .map((tab) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: tab,
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              // width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: 15,
                    itemBuilder: (context, index) => const RecipeCard(),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: 15,
                    itemBuilder: (context, index) => const RecipeCard(),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: 15,
                    itemBuilder: (context, index) => const RecipeCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
