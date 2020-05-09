import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:quiver/async.dart' as quiver;
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/model/soundAssetList.dart';
part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  @observable
  Duration soundTimeout = new Duration();
  Timer soundTimeoutTimer;

  @observable
  Sound playingSound;

  AudioCache _playerCache = AudioCache(prefix: "audio/");

  AudioPlayer _audioPlayer;

  quiver.CountdownTimer countdownTimer;

  _MainStore() {
    _playerCache
        .loadAll(SoundAssetList.sounds.map((audio) => "$audio.mp3").toList());
  }

  @action
  void startTimer(Duration soundTimeout) {
    countdownTimer = quiver.CountdownTimer(soundTimeout, Duration(minutes: 1));
    countdownTimer.listen(_setSoundTimeout, onDone: _timerDone);
  }

  void _setSoundTimeout(quiver.CountdownTimer countdownTimer) {
    this.soundTimeout = countdownTimer.remaining;
    print("Updating timer " + this.soundTimeout.inMinutes.toString());
  }

  void _timerDone() {
    _stop(playingSound);
  }

  @action
  Future<void> setPlayingSound(Sound playingSound) async {
    if (playingSound != null && playingSound.name.isNotEmpty) {
      _play(playingSound);
    } else {
      _stop(playingSound);
      // soundTimeout = new Duration();
    }

    this.playingSound = playingSound;
  }

  bool isPlaying() {
    return this.playingSound != null;
  }

  Future<void> _play(Sound sound) async {
    if (this._audioPlayer != null) {
      await this._audioPlayer.stop();
    }

    this._audioPlayer = await _playerCache.loop(sound.getAudioPath());
  }

  Future<void> _stop(Sound sound) async {
    if (this._audioPlayer != null) {
      await this._audioPlayer.stop();
      this._audioPlayer = null;
    }
  }
}
