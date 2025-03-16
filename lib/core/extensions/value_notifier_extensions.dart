import 'dart:async';

import 'package:flutter/widgets.dart';

extension ObservableValueNotifier<T> on ValueNotifier<T> {
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(value);

    void callback() {
      streamController.add(value);
    }

    addListener(callback);

    return streamController.stream;
  }
}
