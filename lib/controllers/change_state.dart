import 'package:observables/contracts/observable.dart';

class ChangeState implements Observable {
  final List<void Function()> _callbacks = [];
  @override
  void addListener(void Function() callback) {
    if (!_callbacks.contains(callback)) {
      _callbacks.add(callback);
    }
  }

  @override
  void removeListener(void Function() callback) {
    if (_callbacks.contains(callback)) {
      _callbacks.remove(callback);
    }
  }

  void notifyCallback() {
    for (var func in _callbacks) {
      func();
    }
  }
}
