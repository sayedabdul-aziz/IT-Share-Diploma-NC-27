import 'package:book_booster/feature/auth/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

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
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 200),
            const SizedBox(
              height: 10,
            ),
            Text(
              'BOOK BOOSTER',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Be Ready to Read Your Book',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.grey),
            ),
            // Switch(
            //     value: context.read<AppThemeCubit>().isDark,
            //     onChanged: (value) {
            //       setState(() {
            //         context.read<AppThemeCubit>().changeMode(value);
            //       });
            //     })
          ],
        ),
      ),
    );
  }
}
