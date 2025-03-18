import 'package:observables/controllers/state_observable.dart';

extension ReactiveInt on int {
  /// Create reactive class from a primitive int
  StateObservable<int> obs() => StateObservable(this);
}

extension ReactiveDouble on double {
  /// Create reactive class from a primitive double
  StateObservable<double> obs() => StateObservable(this);
}

extension ReactiveString on String {
  /// Create reactive class from a primitive String
  StateObservable<String> obs() => StateObservable(this);
}

extension ReactiveBool on bool {
  /// Create reactive class from a primitive bool
  StateObservable<bool> obs() => StateObservable(this);
}
