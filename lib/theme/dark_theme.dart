import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Quicksand',
  primaryColor: const Color(0xFF6EBF56),
  secondaryHeaderColor: const Color(0xffF7CF3B),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF6EBF56),
    ),
  ), colorScheme: const ColorScheme.light(
    primary: Color(0xFF6EBF56),
    secondary: Color(0xFF6EBF56),
  ).copyWith(background: const Color(0xFFF3F3F3)).copyWith(error: const Color(0xffE50909)),
);
