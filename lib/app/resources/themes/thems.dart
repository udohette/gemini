import 'package:flutter/material.dart';

class Themes{
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(),
  );

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Colors.green,
        onPrimary: Colors.white
      ),
  );
}