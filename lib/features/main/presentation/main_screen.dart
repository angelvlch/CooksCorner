import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/features/home/home_screen.dart';
import 'package:cooks_corner/features/main/presentation/bloc/main_page_bloc.dart';
import 'package:cooks_corner/features/profile/profile_screen.dart';
import 'package:cooks_corner/features/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bottomNavItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppImages.cottageUnActive),
      activeIcon: SvgPicture.asset(AppImages.cottageActive),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppImages.searchUnActive),
      activeIcon: SvgPicture.asset(AppImages.searchActive),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppImages.accountUnActive),
      activeIcon: SvgPicture.asset(AppImages.accountActive),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)?.settings.arguments as String;
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                ),
              ],
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              onTap: (index) {
                BlocProvider.of<MainPageBloc>(context)
                    .add(TabChange(tabIndex: index));
              },
            ),
          ),
          body: [
            HomeScreen(token: token),
            const SearchScreen(),
            const ProfileScreen(),
          ][state.tabIndex],
        );
      },
    );
  }
}
