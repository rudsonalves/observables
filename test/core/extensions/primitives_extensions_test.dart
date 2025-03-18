import 'package:flutter_test/flutter_test.dart';
import 'package:observables/core/extensions/primitives_extensions.dart';

void main() {
  group('Testing reacte primitives', () {
    test('Should test the reactive [int]', () {
      // Arrange
      bool callbackExecuted = false;
      final observableInt = 0.obs();
      callback() {
        callbackExecuted = true;
      }

      // Act
      observableInt.addListener(callback);
      observableInt.state++;

      // Assert
      expect(observableInt.state, 1);
      expect(callbackExecuted, true);
    });

    test('Should test the reactive [double]', () {
      // Arrange
      bool callbackExecuted = false;
      final observableDouble = (0.0).obs();
      callback() {
        callbackExecuted = true;
      }

      // Act
      observableDouble.addListener(callback);
      observableDouble.state += 1.25;

      // Assert
      expect(observableDouble.state, 1.25);
      expect(callbackExecuted, true);
    });

    test('Should test the reactive [String]', () {
      // Arrange
      bool callbackExecuted = false;
      final observableString = 'Olá'.obs();
      callback() {
        callbackExecuted = true;
      }

      // Act
      observableString.addListener(callback);
      observableString.state = 'Até';

      // Assert
      expect(observableString.state, 'Até');
      expect(callbackExecuted, true);
    });

    test('Should test the reactive [bool]', () {
      // Arrange
      bool callbackExecuted = false;
      final observableBool = false.obs();
      callback() {
        callbackExecuted = true;
      }

      // Act
      observableBool.addListener(callback);
      observableBool.state = !observableBool.state;

      // Assert
      expect(observableBool.state, true);
      expect(callbackExecuted, true);
    });
  });
}
