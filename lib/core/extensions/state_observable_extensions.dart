import 'dart:async';

import 'package:observables/controllers/state_observable.dart';

extension ObservableStream<T> on StateObservable<T> {
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(state); // emit InitialState

    void callback() {
      streamController.add(state); // emit others states
    }

    addListener(callback);

    return streamController.stream;
  }
}
