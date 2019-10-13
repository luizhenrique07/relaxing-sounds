import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar()
      : super(
          centerTitle: true,
          backgroundColor: Color(0xFFFCFDFE),
          title: Text(
            'Relaxing Sounds',
            style: TextStyle(
              color: Color(0xFF161F20),
              fontFamily: "Roboto-Black",
            ),
          ),
          elevation: 0.0,
        );
}
