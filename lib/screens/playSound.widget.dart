import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/layout/layout.widget.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/store/main_store.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';

class PlaySound extends StatefulWidget {
  final Sound sound;
  final MainStore store;

  const PlaySound({Key key, this.sound, this.store}) : super(key: key);

  @override
  _PlaySoundState createState() =>
      _PlaySoundState(sound: this.sound, store: this.store);
}

class _PlaySoundState extends State<PlaySound> {
  final Sound sound;
  final MainStore store;
  Duration _duration = Duration(hours: 0, minutes: 0);

  _PlaySoundState({this.sound, this.store});

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
            _getSoundIcon(),
            _playPauseButtom(),
            _timerButtom(context)
          ],
        ),
      ),
    );
  }

  Widget _playPauseButtom() {
    return Observer(
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
    );
  }

  Widget _timerButtom(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.timer,
        color: Colors.white,
        size: AppSizes.blockSize * 15,
      ),
      onTap: () {
        showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text("My Super title"),
            content: DurationPicker(
              duration: _duration,
              onChange: (val) {
                this.setState(() => _duration = val);
              },
              snapToMins: 5,
            ),
          ),
        );
      },
    );
  }

  Widget _getSoundIcon() {
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

// class PlaySound extends StatelessWidget {
//   final Sound sound;
//   final MainStore store;
//   Duration _duration = Duration(hours: 0, minutes: 0);

//   PlaySound({@required this.sound, @required this.store});

//   @override
//   Widget build(BuildContext context) {
//     // print(object)
//     return Layout(
//       title: I18n.getValue(sound.fileName),
//       child: Container(
//         padding: EdgeInsets.only(bottom: 30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             _getSoundIcon(),
//             _playPauseButtom(),
//             _timerButtom(context)
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _playPauseButtom() {
//     return Observer(
//       builder: (_) {
//         if (store.playingSound != null &&
//             store.playingSound.name == sound.name) {
//           return GestureDetector(
//             child: Icon(
//               Icons.pause,
//               color: Colors.white,
//               size: AppSizes.blockSize * 50,
//             ),
//             onTap: () {
//               store.setIsPlaying(false);
//               store.setPlayingSound(null);
//             },
//           );
//         } else {
//           return GestureDetector(
//             child: Icon(
//               Icons.play_arrow,
//               color: Colors.white,
//               size: AppSizes.blockSize * 50,
//             ),
//             onTap: () {
//               store.setIsPlaying(true);
//               store.setPlayingSound(sound);
//             },
//           );
//         }
//       },
//     );
//   }

//   Widget _timerButtom(BuildContext context) {
//     return GestureDetector(
//       child: Icon(
//         Icons.timer,
//         color: Colors.white,
//         size: AppSizes.blockSize * 15,
//       ),
//       onTap: () {
//         showDialog(
//           context: context,
//           child: new AlertDialog(
//             title: new Text("My Super title"),
//             content: DurationPicker(
//               duration: _duration,
//               onChange: (val) {
//                 print(val);
//               },
//               snapToMins: 5,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _getSoundIcon() {
//     return Center(
//       child: Hero(
//         tag: sound.fileName,
//         child: Image(
//           image: AssetImage(sound.getLogoPath()),
//           height: AppSizes.blockSize * 50,
//         ),
//       ),
//     );
//   }
// }
