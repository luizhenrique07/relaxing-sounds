import 'package:flutter/material.dart';

class MainColors {
  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  //static const Color planetCard = const Color(0xFF434273);
  static const Color planetCard = const Color(0xFF8685E5);
  //static const Color planetListBackground = const Color(0xFF3E3963);
  static const Color planetPageBackground = const Color(0xFF736AB7);
  static const Color planetTitle = const Color(0xFFFFFFFF);
  static const Color planetLocation = const Color(0x66FFFFFF);
  static const Color planetDistance = const Color(0x66FFFFFF);

  static Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
}

class TextStyles {
  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
      color: MainColors.appBarTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 24.0);

  static const TextStyle planetTitle = const TextStyle(
      color: MainColors.planetTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  static const TextStyle planetLocation = const TextStyle(
      color: MainColors.planetLocation,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0);

  static const TextStyle planetDistance = const TextStyle(
      color: MainColors.planetDistance,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 10.0);
}
