import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/store/main_store.dart';
import 'package:relaxing_sounds/model/soundAssetList.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/widget/sound_list_item.widget.dart';

class SoundsListView extends StatelessWidget {
  final MainStore store;

  SoundsListView({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSizes.blockSizeVertical * 3),
      children: <Widget>[
        ...SoundAssetList.sounds
            .map(
              (sound) => SoundListItem(
                store: store,
                sound: Sound(
                  name: I18n.of(context).translate(sound),
                  fileName: sound,
                ),
              ),
            )
            .toList(),
        SizedBox(
          height: AppSizes.blockSizeVertical * 7,
        ),
        Container(
          height: AppSizes.blockSizeVertical * 20,
          child: Lottie.asset('assets/animations/sky.json'),
        )
      ],
    );
  }
}
