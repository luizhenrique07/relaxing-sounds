import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/screens/playSound.widget.dart';
import 'package:relaxing_sounds/store/main_store.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/style/main_colors.dart';

class SoundListItem extends StatelessWidget {
  final Sound sound;
  final MainStore store;

  SoundListItem({@required this.sound, @required this.store});
  @override
  Widget build(BuildContext context) {
    final soundIcon = Container(
      alignment: FractionalOffset(0.0, 0.5),
      child: Hero(
        tag: sound.fileName,
        child: Image(
          image: AssetImage(sound.getLogoPath()),
          height: AppSizes.blockSize * 20,
        ),
      ),
    );

    isPlaying(Sound storeSound) {
      if (storeSound == null) return false;
      return storeSound.name == sound.name;
    }

    final soundCard = Container(
      margin: EdgeInsets.only(
        left: AppSizes.blockSizeVertical * 4,
        right: AppSizes.blockSizeVertical * 3,
      ),
      decoration: BoxDecoration(
        color: MainColors.soundCard,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: AppSizes.blockSize * 5,
          left: AppSizes.blockSize * 17,
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              sound.name,
              style: TextStyle(
                color: MainColors.soundTitle,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: AppSizes.blockSize * 5,
              ),
            ),
            Container(
              color: MainColors.appBarGradientStart,
              width: AppSizes.blockSize * 15,
              height: AppSizes.blockSizeVertical * 0.4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            Container(
              height: AppSizes.blockSizeVertical * 5,
              child: Observer(
                builder: (_) => Text(
                  isPlaying(store.playingSound) ? "Tocando" : "",
                  style: TextStyle(
                    color: MainColors.soundTitle,
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.w300,
                    fontSize: AppSizes.blockSize * 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      height: AppSizes.blockSizeVertical * 15,
      margin: EdgeInsets.only(
        top: AppSizes.blockSizeVertical * 2,
        bottom: AppSizes.blockSizeVertical * 2,
      ),
      child: FlatButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (BuildContext context) {
            return PlaySound(sound: sound, store: store);
          }),
        ),
        child: Stack(
          children: <Widget>[
            soundCard,
            soundIcon,
          ],
        ),
      ),
    );
  }
}
