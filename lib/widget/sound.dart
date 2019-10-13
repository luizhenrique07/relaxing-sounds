import 'package:flutter/material.dart';

class Sound extends StatelessWidget {
  final String soundImageAsset;
  final String soundName;

  const Sound({this.soundImageAsset, this.soundName});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: soundName,
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Container(
            height: 140,
            width: 140,
            color: Color(0xFFC4C4C4),
            child: Image.asset(soundImageAsset),
          ),
        ),
      ),
    );
  }
}
