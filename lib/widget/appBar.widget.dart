import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  final String titleText;

  MainAppBar({this.titleText})
      : super(
          centerTitle: true,
          backgroundColor: Color(0xFF1c9af5),
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
