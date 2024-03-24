import 'package:flutter/material.dart';

const mobileBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const webBackgroundColor = Color.fromRGBO(18, 18, 18, 1);
const mobileSearchColor = Color.fromRGBO(38, 38, 38, 1);
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const kPrimaryColor = Colors.white;
const kSecondaryColor = Colors.grey;
const kTextColor = Colors.black;

final kColorScheme = ColorScheme.fromSeed(seedColor: blueColor);

final kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: blueColor, brightness: Brightness.dark);

final ThemeData kDarkTheme = ThemeData.dark().copyWith(
    colorScheme: kDarkColorScheme,
    primaryColor: kTextColor,
    primaryColorDark: kPrimaryColor,
    appBarTheme: AppBarTheme(
        toolbarHeight: 50,
        centerTitle: true,
        scrolledUnderElevation: 3,
        surfaceTintColor: kDarkColorScheme.surface,
        shadowColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: blueColor,
          foregroundColor: kDarkColorScheme.onPrimary),
    ),
    iconTheme: const IconThemeData(color: blueColor));

final ThemeData kTheme = ThemeData(
    colorScheme: kColorScheme,
    primaryColor: kPrimaryColor,
    primaryColorDark: kTextColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        toolbarHeight: 50,
        centerTitle: true,
        scrolledUnderElevation: 3,
        surfaceTintColor: kColorScheme.surface,
        shadowColor: kTextColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary),
    ),
    iconTheme: const IconThemeData(color: kTextColor));
