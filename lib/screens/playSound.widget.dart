import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/layout/layout.widget.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/store/main_store.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/style/main_colors.dart';

class PlaySound extends StatefulWidget {
  final Sound sound;
  final MainStore store;

  const PlaySound({Key key, this.sound, this.store}) : super(key: key);

  @override
  _PlaySoundState createState() => _PlaySoundState();
}

class _PlaySoundState extends State<PlaySound> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  _PlaySoundState();

  @override
  Widget build(BuildContext context) {
    // print(object)
    return Layout(
      title: I18n.of(context).translate(widget.sound.fileName),
      child: Container(
        padding: EdgeInsets.only(
          bottom: AppSizes.blockSize * 8,
          top: AppSizes.blockSize * 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _getSoundIcon(),
            _playPauseButtom(),
            Observer(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _timerButtom(context, widget.store.soundTimeout),
                  _isValidDuration(widget.store.soundTimeout)
                      ? Text(
                          "${widget.store.soundTimeout.inMinutes.toString()} min.",
                          style: TextStyle(
                            fontSize: AppSizes.blockSize * 8,
                            color: MainColors.appBarTitle,
                            fontFamily: "Roboto-Black",
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isValidDuration(Duration duration) {
    return duration != null && duration.inMinutes > 0;
  }

  Widget _playPauseButtom() {
    return Observer(
      builder: (_) {
        if (widget.store.playingSound != null &&
            widget.store.playingSound.name == widget.sound.name) {
          return GestureDetector(
            child: Icon(
              Icons.pause,
              color: Colors.white,
              size: AppSizes.blockSize * 50,
            ),
            onTap: () {
              widget.store.setPlayingSound(null);
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
              widget.store.setPlayingSound(widget.sound);
            },
          );
        }
      },
    );
  }

  Widget _timerButtom(BuildContext context, Duration initialDuration) {
    return GestureDetector(
      child: Icon(
        Icons.timer,
        color: Colors.white,
        size: AppSizes.blockSize * 15,
      ),
      onTap: () async {
        await showDialog<int>(
            context: context,
            builder: (BuildContext context) {
              return NumberPicker(
                minValue: 3,
                maxValue: 12000,
                // title: new Text(I18n.of(context).translate("timer")),
                value: 3,
                onChanged: (value) =>
                    widget.store.startTimer(Duration(minutes: value)),
                step: 3,
              );
            });

        // if (value != null) {
        //   widget.store.startTimer(Duration(minutes: value));
        // }
      },
    );
  }

  Widget _getSoundIcon() {
    return Center(
      child: Hero(
        tag: widget.sound.fileName,
        child: Image(
          image: AssetImage(widget.sound.getLogoPath()),
          height: AppSizes.blockSize * 50,
        ),
      ),
    );
  }
}
