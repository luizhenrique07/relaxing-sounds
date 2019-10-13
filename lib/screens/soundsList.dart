import 'package:flutter/material.dart';
import 'package:relaxing_sounds/widget/appBar.dart';

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      backgroundColor: Color(0xFFF0F3F7),
      appBar: MainAppBar(),
      // body is the majority of the screen.
      body: Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
