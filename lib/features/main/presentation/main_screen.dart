import 'package:cooks_corner/core/constants/app_images.dart';
import 'package:cooks_corner/features/home/home_screen.dart';
import 'package:cooks_corner/features/profile/profile_screen.dart';
import 'package:cooks_corner/features/search/seatch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bottomNavItems = [
    NavigationDestination(
      icon: SvgPicture.asset(AppImages.cottageUnActive),
      selectedIcon: SvgPicture.asset(AppImages.cottageActive),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(AppImages.searchUnActive),
      selectedIcon: SvgPicture.asset(AppImages.searchActive),
      label: '',
    ),
    NavigationDestination(
      icon: SvgPicture.asset(AppImages.accountUnActive),
      selectedIcon: SvgPicture.asset(AppImages.accountActive),
      label: '',
    ),
  ];

  final bottomNavScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: bottomNavItems,
      ),
    );
  }
}
