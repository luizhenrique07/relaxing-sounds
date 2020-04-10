import 'package:mobx/mobx.dart';
import 'package:relaxing_sounds/model/sound.dart';
part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  @observable
  bool isPlaying = false;

  @observable
  Sound playingSound;

  @action
  void setIsPlaying(bool isPlaying) {
    this.isPlaying = isPlaying;
  }

  @action
  void setPlayingSound(Sound playingSound) {
    this.playingSound = playingSound;
  }
}
