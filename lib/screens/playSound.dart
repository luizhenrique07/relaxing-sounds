import 'package:flutter/material.dart';

class PlaySound extends StatelessWidget {
  final String soundName;

  const PlaySound(this.soundName);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: soundName,
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(soundName),
      ),
    );
  }
}
