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
    final planetThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      //margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'planet-icon-${sound.name}',
        child: new Image(
          image: new AssetImage(sound.getLogoPath()),
          height: AppSizes.blockSize * 30,
          width: AppSizes.blockSize * 30,
        ),
      ),
    );

    final planetCard = new Container(
      //margin: const EdgeInsets.only(left: 72.0, right: 24.0),
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
            new Text(sound.name, style: TextStyles.planetTitle),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.location_on,
                    size: 14.0, color: MainColors.planetDistance),
                new Text(sound.description, style: TextStyles.planetDistance),
                new Container(width: 24.0),
                new Icon(Icons.flight_land,
                    size: 14.0, color: MainColors.planetDistance),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () => print("clicado"),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
