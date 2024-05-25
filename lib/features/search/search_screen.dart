import 'package:cooks_corner/core/constants/app_colors.dart';
import 'package:cooks_corner/core/constants/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 44 / 392,
              vertical: 4),
          child: const Text('Chefs'),
        ),
      ),
      Tab(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 44 / 392,
              vertical: 4),
          child: const Text('Recipes', overflow: TextOverflow.ellipsis),
        ),
      ),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              height: 52,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                color: AppColors.secondary,
              ),
              child: TabBar(
                indicatorWeight: 0,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                labelColor: AppColors.background,
                labelStyle: AppFonts.s14w500,
                dividerColor: Colors.transparent,
                indicator: const BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                tabs: tabs,
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'What to eat\ntoday?',
            style: AppFonts.s22w500,
            textAlign: TextAlign.center,
          ),
        ),
        body: const Column(
          children: [
            SizedBox(height: 24),
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
