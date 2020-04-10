import 'package:flutter/material.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/store/main_store.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/widget/list_item_sound.widget.dart';
import 'package:relaxing_sounds/widget/playing_sound_bar.widget.dart';

class SoundsList extends StatelessWidget {
  final MainStore store;

  List<String> _sounds = [
    'thunder_storm',
    "forest",
    "ligth_rain",
    "ocean",
    "water",
    "waterfall"
  ];

  SoundsList({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSizes.blockSizeVertical * 3),
      children: _sounds
          .map(
            (sound) => ListItemSound(
              store: store,
              sound: Sound(
                name: I18n.getValue(sound),
                fileName: sound,
              ),
            ),
          )
          .toList(),
    );
  }
}
