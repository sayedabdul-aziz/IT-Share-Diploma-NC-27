import 'package:flutter/material.dart';
import 'package:muslim_pro/feature/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AppLayoutView()));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/big-background.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Image.asset(
            'assets/images/quraan-bottom.png',
            width: 200,
          )
        ],
      ),
    );
  }
}
