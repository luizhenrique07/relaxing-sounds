import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/style/main_colors.dart';

class ListItemSound extends StatelessWidget {
  final Sound sound;

  ListItemSound(this.sound);
  @override
  Widget build(BuildContext context) {
    final soundIconThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      child: new Hero(
        tag: sound.fileName,
        child: new Image(
          image: new AssetImage(sound.getLogoPath()),
          height: AppSizes.blockSize * 20,
        ),
      ),
    );

    final soundCard = new Container(
      margin: EdgeInsets.only(
        left: AppSizes.blockSizeVertical * 4,
        right: 24.0,
      ),
      decoration: new BoxDecoration(
        color: MainColors.planetCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              sound.name,
              style: TextStyle(
                color: MainColors.planetDistance,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: AppSizes.blockSize * 5,
              ),
            ),
            new Container(
              color: MainColors.appBarGradientStart,
              width: AppSizes.blockSize * 15,
              height: AppSizes.blockSizeVertical * 0.4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ],
        ),
      ),
    );

    return new Container(
      height: AppSizes.blockSizeVertical * 15,
      margin: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () => print("clicado"),
        child: new Stack(
          children: <Widget>[
            soundCard,
            soundIconThumbnail,
          ],
        ),
      ),
    );
  }
}
