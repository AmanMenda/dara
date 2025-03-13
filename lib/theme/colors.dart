import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const ColorSwatch blue = MaterialColor(
    0xFF3197B9,
    <int, Color>{
      50: Color(0xFFB1DCEA),
      100: Color(0xFFA2D5E6),
      200: Color(0xFF83C7DE),
      300: Color(0xFF64B9D6),
      400: Color(0xFF45ABCD),
      500: Color(0xFF3197B9),
      600: Color(0xFF2E8DAC),
      700: Color(0xFF2A829F),
      800: Color(0xFF277792),
      900: Color(0xFF236C84),
    },
  );

  // main colors
  static const Color primary = Color(0xFFA8DADC);
  static const Color secondary = Color(0xFF2A9D8F);

  // other colors
  static const Color yellow = Color(0xFFF4A261);
  static const Color grey = Color(0xFFE5E5E5);
  static const Color red = Color(0xFFE76F51);
}