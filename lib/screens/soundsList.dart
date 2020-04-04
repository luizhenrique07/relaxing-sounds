import 'package:flutter/material.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/widget/appBar.dart';
import 'package:relaxing_sounds/widget/list_item_sound.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';

class SoundsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSizes.loadAppSizes(context);
    return Scaffold(
      backgroundColor: Color(0xFFF0F3F7),
      appBar: MainAppBar(),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          new ListItemSound(
            Sound(name: "thunder_storm", description: "teste"),
          ),
          new ListItemSound(
            Sound(name: "forest", description: "teste"),
          ),
          new ListItemSound(
            Sound(name: "ligth_rain", description: "teste"),
          ),
          new ListItemSound(
            Sound(name: "ocean", description: "teste"),
          ),
          new ListItemSound(
            Sound(name: "water", description: "teste"),
          ),
          new ListItemSound(
            Sound(name: "waterfall", description: "teste"),
          ),
        ],
      ),
    );
  }
}
