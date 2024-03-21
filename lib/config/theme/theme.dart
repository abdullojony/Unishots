import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 109, 168, 223);

final kColorScheme = ColorScheme.fromSeed(seedColor: seedColor);

final kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark);

final loginBackground = kColorScheme.primary.withOpacity(0.6);
final primaryColor = kColorScheme.primary;
final feedBackground = kColorScheme.secondaryContainer.withOpacity(0.7);

ThemeData kDarkTheme = ThemeData.dark().copyWith(
    colorScheme: kDarkColorScheme,
    primaryColor: seedColor,
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
          backgroundColor: seedColor,
          foregroundColor: kDarkColorScheme.onPrimary),
    ),
    iconTheme: const IconThemeData(color: seedColor));

ThemeData kTheme = ThemeData(
    colorScheme: kColorScheme,
    primaryColor: kColorScheme.primary,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        toolbarHeight: 50,
        centerTitle: true,
        scrolledUnderElevation: 3,
        surfaceTintColor: kColorScheme.surface,
        shadowColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary),
    ),
    iconTheme: IconThemeData(color: kColorScheme.primary));
