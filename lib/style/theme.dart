import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_news/style/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: defaultColor, type: BottomNavigationBarType.fixed),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis),
      bodyText2: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis)),
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
    color: Colors.black12,
    elevation: 50,
    scrolledUnderElevation: 50,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black12,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.deepOrange,
      type: BottomNavigationBarType.fixed),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis),
      bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis)),
  scaffoldBackgroundColor: Colors.black12,
);
