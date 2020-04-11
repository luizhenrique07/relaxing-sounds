import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/layout/layout.widget.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/store/main_store.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';

class PlaySound extends StatelessWidget {
  final Sound sound;
  final MainStore store;

  PlaySound({@required this.sound, @required this.store});

  @override
  Widget build(BuildContext context) {
    // print(object)
    return Layout(
      title: I18n.getValue(sound.fileName),
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _getIcon(),
            Observer(
              builder: (_) {
                if (store.playingSound != null &&
                    store.playingSound.name == sound.name) {
                  return GestureDetector(
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: AppSizes.blockSize * 50,
                    ),
                    onTap: () {
                      store.setIsPlaying(false);
                      store.setPlayingSound(null);
                    },
                  );
                } else {
                  return GestureDetector(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: AppSizes.blockSize * 50,
                    ),
                    onTap: () {
                      store.setIsPlaying(true);
                      store.setPlayingSound(sound);
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _getIcon() {
    return Center(
      child: Hero(
        tag: sound.fileName,
        child: Image(
          image: AssetImage(sound.getLogoPath()),
          height: AppSizes.blockSize * 50,
        ),
      ),
    );
  }
}
