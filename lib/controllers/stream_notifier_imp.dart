import 'dart:async';

import 'package:observables/contracts/stream_notifier.dart';

class StreamNotifier<T> implements IStreamNotifier<T> {
  T _state;

  StreamNotifier(this._state);

  @override
  get state => _state;

  final StreamController<T> _streamController = StreamController<T>();

  @override
  Stream<T> get stream => _streamController.stream;

  @override
  void emit(newState) {
    if (_state == newState) return;
    _state = newState;
    _streamController.add(newState);
  }

  @override
  Future<void> dispose() async {
    await _streamController.close();
  }
}
