import 'package:flutter/material.dart';

extension ExtendedBuildContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
  TextTheme get texts => Theme.of(this).textTheme;
}

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.indigo.shade900,
        onPrimary: Colors.white,
        secondary: Colors.indigo.shade400,
        onSecondary: Colors.white,
        error: Colors.red.shade800,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.grey.shade500,
        onSurface: Colors.black,
      ),
      disabledColor: Colors.grey.shade400,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.0,
          height: 64.0 / 57.0,
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          fontSize: 45.0,
          height: 52.0 / 45.0,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 36.0,
          height: 44.0 / 36.0,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 32.0,
          height: 40.0 / 32.0,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.0,
          height: 36.0 / 28.0,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.0,
          height: 32.0 / 24.0,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontSize: 28.0,
          height: 28.0 / 22.0,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 24.0,
          height: 24.0 / 16.0,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14.0,
          height: 20.0 / 14.0,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14.0,
          height: 20.0 / 14.0,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12.0,
          height: 16.0 / 12.0,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11.0,
          height: 16.0 / 11.0,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          height: 24.0 / 16.0,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          height: 20.0 / 14.0,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 12.0,
          height: 16.0 / 12.0,
          fontWeight: FontWeight.w400,
        ),
      ).apply(
        bodyColor: Colors.black,
        decorationColor: Colors.black,
        displayColor: Colors.black,
      ),
    );
