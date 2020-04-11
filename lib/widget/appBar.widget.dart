import 'package:flutter/material.dart';
import 'package:relaxing_sounds/style/main_colors.dart';

class MainAppBar extends AppBar {
  final String titleText;

  MainAppBar({this.titleText})
      : super(
          centerTitle: true,
          backgroundColor: MainColors.appBarGradientStart,
          title: Text(
            titleText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto-Black",
            ),
          ),
          elevation: 0.0,
        );
}
