import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:muslim_pro/core/app_color.dart';
import 'package:muslim_pro/feature/azkar/view/azkar_view.dart';
import 'package:muslim_pro/feature/home/body_view.dart';
import 'package:muslim_pro/feature/info_view.dart';
import 'package:muslim_pro/feature/quran/quran_view.dart';
import 'package:muslim_pro/feature/sebha/view/sebha_view.dart';

class AppLayoutView extends StatefulWidget {
  const AppLayoutView({super.key});

  @override
  State<AppLayoutView> createState() => _AppLayoutViewState();
}

class _AppLayoutViewState extends State<AppLayoutView> {
  List<Widget> screen = [
    const HomeView(),
    const AzkarView(),
    const SebhaView(),
    const InfoView(),
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: screen[_bottomNavIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppStyle.cardColor3,
          elevation: 0.0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QuranView(),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset('assets/images/quraan-bottom.png'),
          ),
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [
            Icons.home,
            Icons.book_rounded,
            Icons.pie_chart_outline_rounded,
            Icons.info
          ],
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          activeColor: AppStyle.primaryColor,
          inactiveColor: Colors.grey,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
      ),
    );
  }
}
