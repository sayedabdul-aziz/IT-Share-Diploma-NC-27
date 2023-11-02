import 'package:book_booster/core/app_colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.lightScaffoldbG,
    hoverColor: Colors.blueAccent,
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: AppColor.lightScaffoldbG,
        titleTextStyle: TextStyle(color: AppColor.black)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: AppColor.black, fontSize: 18, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
        color: AppColor.black,
        fontSize: 16,
      ),
      displaySmall: TextStyle(
          color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w400),
    ),
    dividerTheme: DividerThemeData(color: AppColor.grey, thickness: 1.5),
    iconTheme: IconThemeData(color: AppColor.lightPrimary),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(5),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.lightPrimary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.lightPrimary)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
    ));

var darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.darkScaffoldbG,
    hoverColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: AppColor.darkPrimary,
        titleTextStyle: TextStyle(color: AppColor.black)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: AppColor.white, fontSize: 18, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
        color: AppColor.white,
        fontSize: 16,
      ),
      displaySmall: TextStyle(
          color: AppColor.white, fontSize: 14, fontWeight: FontWeight.w400),
    ),
    dividerTheme: DividerThemeData(color: AppColor.grey, thickness: 1.5),
    iconTheme: IconThemeData(color: AppColor.darkPrimary),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(5),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.darkPrimary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.darkPrimary)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red)),
    ));
