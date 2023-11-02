import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/app_color.dart';
import 'package:muslim_pro/feature/splach_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: GoogleFonts.kufam().fontFamily,
            textTheme: const TextTheme(
                displayMedium: TextStyle(
                    color: AppStyle.titleBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
            appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: AppStyle.titleBlack),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: AppStyle.cardColor1,
                titleTextStyle: GoogleFonts.kufam().copyWith(
                    color: AppStyle.titleBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        home: const SplashView(),
      ),
    );
  }
}
