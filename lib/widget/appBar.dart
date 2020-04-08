import 'package:flutter/material.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';

class MainAppBar extends AppBar {
  MainAppBar()
      : super(
          centerTitle: true,
          backgroundColor: Color(0xFF1c9af5),
          title: Text(
            I18n.getValue('title'),
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto-Black",
            ),
          ),
          elevation: 0.0,
        );
}
