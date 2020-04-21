// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$soundTimeoutAtom = Atom(name: '_MainStore.soundTimeout');

  @override
  Duration get soundTimeout {
    _$soundTimeoutAtom.context.enforceReadPolicy(_$soundTimeoutAtom);
    _$soundTimeoutAtom.reportObserved();
    return super.soundTimeout;
  }

  @override
  set soundTimeout(Duration value) {
    _$soundTimeoutAtom.context.conditionallyRunInAction(() {
      super.soundTimeout = value;
      _$soundTimeoutAtom.reportChanged();
    }, _$soundTimeoutAtom, name: '${_$soundTimeoutAtom.name}_set');
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

  final _$setPlayingSoundAsyncAction = AsyncAction('setPlayingSound');

  @override
  Future<void> setPlayingSound(Sound playingSound) {
    return _$setPlayingSoundAsyncAction
        .run(() => super.setPlayingSound(playingSound));
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void startTimer(Duration soundTimeout) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.startTimer(soundTimeout);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'soundTimeout: ${soundTimeout.toString()},playingSound: ${playingSound.toString()}';
    return '{$string}';
  }
}
