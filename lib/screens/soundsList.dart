import 'package:flutter/material.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/widget/list_item_sound.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';

class SoundsList extends StatelessWidget {
  SoundsList({
    Key key,
  }) : super(key: key);

  List<String> _sounds = [
    'thunder_storm',
    "forest",
    "ligth_rain",
    "ocean",
    "water",
    "waterfall"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSizes.blockSizeVertical * 3),
      children: _sounds
          .map(
            (sound) => ListItemSound(
              Sound(
                name: I18n.getValue(sound),
                fileName: sound,
              ),
            ),
          )
          .toList(),
    );
  }
}
