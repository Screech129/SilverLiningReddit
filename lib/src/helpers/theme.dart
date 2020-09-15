import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromARGB(255, 0, 56, 48),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Color.fromARGB(255, 0, 56, 48),
  primaryColorDark: Color.fromARGB(255, 0, 56, 48),
  accentColor: Color.fromARGB(255, 0, 181, 181),
  accentColorBrightness: Brightness.dark,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);
