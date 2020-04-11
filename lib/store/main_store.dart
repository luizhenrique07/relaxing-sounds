import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:relaxing_sounds/model/sound.dart';
import 'package:relaxing_sounds/model/soundAssetList.dart';
part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  @observable
  bool isPlaying = false;

  @observable
  Sound playingSound;

  AudioCache playerCache = AudioCache(prefix: "audio/");

  AudioPlayer audioPlayer;

  _MainStore() {
    playerCache
        .loadAll(SoundAssetList.sounds.map((audio) => "$audio.mp3").toList());
  }

  @action
  void setIsPlaying(bool isPlaying) {
    this.isPlaying = isPlaying;
  }

  @action
  Future<void> setPlayingSound(Sound playingSound) async {
    if (playingSound != null && playingSound.name.isNotEmpty) {
      play(playingSound);
    } else {
      stop(playingSound);
    }

    this.playingSound = playingSound;
  }

  Future<void> play(Sound sound) async {
    if (this.audioPlayer != null) {
      await this.audioPlayer.stop();
    }

    this.audioPlayer = await playerCache.loop(sound.getAudioPath());
  }

  Future<void> stop(Sound sound) async {
    if (this.audioPlayer != null) {
      await this.audioPlayer.stop();
      this.audioPlayer = null;
    }
  }
}
