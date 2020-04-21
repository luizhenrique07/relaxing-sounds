import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
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

  _MainStore() {
    _playerCache
        .loadAll(SoundAssetList.sounds.map((audio) => "$audio.mp3").toList());
  }

  @action
  void startTimer(Duration soundTimeout) {
    _cancelTimer();
    _setSoundTimeout(soundTimeout);
  }

  void _setSoundTimeout(Duration soundTimeout) {
    this.soundTimeout = soundTimeout;

    if (soundTimeout.inMinutes > 0) {
      _runTimer();
    } else {
      _timerStopsSound();
    }
  }

  void _runTimer() {
    var newDuration = Duration(minutes: this.soundTimeout.inMinutes - 1);
    this.soundTimeoutTimer =
        Timer(Duration(minutes: 1), () => _setSoundTimeout(newDuration));
  }

  void _timerStopsSound() {
    setPlayingSound(null);
    _stop(playingSound);
    _cancelTimer();
  }

  void _cancelTimer() {
    if (soundTimeoutTimer != null) soundTimeoutTimer.cancel();
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
