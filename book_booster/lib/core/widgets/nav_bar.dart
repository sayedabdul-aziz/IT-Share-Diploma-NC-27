import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:book_booster/core/app_colors.dart';
import 'package:book_booster/feature/cart/cart_view.dart';
import 'package:book_booster/feature/favourite/fav_view.dart';
import 'package:book_booster/feature/home/presentation/view/products_view.dart';
import 'package:book_booster/feature/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> screen = [
    const ProductView(),
    const FavouriteScreen(),
    const CartScreen(),
    const ProfileView(),
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {
          //SearchView
        },
        child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(FontAwesomeIcons.magnifyingGlass)),
      ),
      //params

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          FontAwesomeIcons.house,
          FontAwesomeIcons.heart,
          FontAwesomeIcons.cartShopping,
          FontAwesomeIcons.user,
        ],

        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeColor: AppColor.lightPrimary,
        inactiveColor: Colors.grey,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
