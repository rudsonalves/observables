import 'package:flutter/widgets.dart';
import 'package:observables/controllers/change_state.dart';

@visibleForTesting
class ObservableCounter extends ChangeState {
  int counter = 0;

  void increment() {
    counter++;
    notifyCallback();
  }
}
