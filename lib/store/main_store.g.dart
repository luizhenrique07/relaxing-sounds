// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$isPlayingAtom = Atom(name: '_MainStore.isPlaying');

  @override
  bool get isPlaying {
    _$isPlayingAtom.context.enforceReadPolicy(_$isPlayingAtom);
    _$isPlayingAtom.reportObserved();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.context.conditionallyRunInAction(() {
      super.isPlaying = value;
      _$isPlayingAtom.reportChanged();
    }, _$isPlayingAtom, name: '${_$isPlayingAtom.name}_set');
  }

  final _$playingSoundAtom = Atom(name: '_MainStore.playingSound');

  @override
  Sound get playingSound {
    _$playingSoundAtom.context.enforceReadPolicy(_$playingSoundAtom);
    _$playingSoundAtom.reportObserved();
    return super.playingSound;
  }

  @override
  set playingSound(Sound value) {
    _$playingSoundAtom.context.conditionallyRunInAction(() {
      super.playingSound = value;
      _$playingSoundAtom.reportChanged();
    }, _$playingSoundAtom, name: '${_$playingSoundAtom.name}_set');
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void setIsPlaying(bool isPlaying) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setIsPlaying(isPlaying);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayingSound(Sound playingSound) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setPlayingSound(playingSound);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isPlaying: ${isPlaying.toString()},playingSound: ${playingSound.toString()}';
    return '{$string}';
  }
}
