import 'package:flutter/material.dart';
import 'package:relaxing_sounds/widget/appBar.dart';
import 'package:relaxing_sounds/widget/sound.dart';

class SoundsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F3F7),
      appBar: MainAppBar(),
      body: ListView(
        padding: EdgeInsets.only(top: 30),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: new Sound(
                  soundName: "Ocean",
                  soundImageAsset: "assets/sounds/ocean.jpg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
