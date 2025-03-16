import 'package:flutter/material.dart';
import 'package:observables/controllers/change_state.dart';
import 'package:observables/controllers/state_observable.dart';

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {
  final List<ChangeState> _changeStates = [];

  void useChangeState(ChangeState changeState) {
    changeState.addListener(callback);
    _changeStates.add(changeState);
  }

  StateObservable<R> userStateObservable<R>(R state) {
    final stateObservable = StateObservable<R>(state);
    useChangeState(stateObservable);
    return stateObservable;
  }

  void callback() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final changeState in _changeStates) {
      changeState.removeListener(callback);
    }

    super.dispose();
  }
}
