import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Tab> tabs = [
    const Tab(text: 'Chefs'),
    const Tab(text: 'Recipes'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs,
          ),
          centerTitle: true,
          title: const Text(
            'What to eat\ntoday?',
            style: AppFonts.s22w500,
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 24),
            Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12)),
            ),
            Expanded(
              child: TabBarView(children: [
                Icon(Icons.flight, size: 350),
                Icon(Icons.directions_transit, size: 350),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
