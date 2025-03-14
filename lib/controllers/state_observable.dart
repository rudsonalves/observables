import 'package:observables/contracts/observable_state.dart';
import 'package:observables/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState {
  T _state;

  @override
  T get state => _state;

  StateObservable(this._state);

  set state(T newState) {
    if (_state == newState) return;
    _state = newState;
    notifyCallback();
  }
}
