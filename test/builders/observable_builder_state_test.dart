import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observables/controllers/state_observable.dart';
import 'package:observables/core/extensions/state_observable_extensions.dart';
import 'package:observables/core/extensions/value_notifier_extensions.dart';

import '../untestable/controllers/product_controller.dart';
import '../untestable/entities/product_entity.dart';
import '../untestable/states/base_state.dart';

void main() {
  group('Should test ObservableBuilderState', () {
    test('Should update state correctly when we increment counter', () {
      // Arrange
      final counterState = StateObservable<int>(0);

      // Act
      counterState.state++;

      // Assert
      expect(counterState.state, 1);
    });

    test(
      'Should execute StateObservable callback when we increment the counter',
      () {
        // Arrange
        final counterState = StateObservable<int>(0);

        bool isCallbackExecuted = false;
        void callback() {
          isCallbackExecuted = true;
        }

        counterState.addListener(callback);

        // Act
        counterState.state++;

        // Assert
        expect(counterState.state, 1);
        expect(isCallbackExecuted, true);
      },
    );

    test('Should generate SuccessState when we call (getProducts)', () {
      // Arrage
      final ProductController productController = ProductController();
      expect(productController.state, isA<InitialState>());

      // Act
      productController.getProducts();

      // Assert
      expect(productController.state, isA<SuccessState>());
    });

    test('Should generate states in sequence', () {
      final ProductController productController = ProductController();
      expect(
        productController.asStream(),
        emitsInOrder([
          isInstanceOf<InitialState>(),
          isInstanceOf<LoadingState>(),
          isInstanceOf<SuccessState<List<Product>>>(),
        ]),
      );

      // Act
      productController.getProducts();
    });

    test(
      'Should generate states in sequence when we have success and after get error',
      () {
        final ProductController productController = ProductController();
        expect(
          productController.asStream(),
          emitsInOrder([
            isInstanceOf<InitialState>(),
            isInstanceOf<LoadingState>(),
            isInstanceOf<ErrorState>(),
            isInstanceOf<LoadingState>(),
            isInstanceOf<SuccessState>(),
          ]),
        );

        // Act
        productController.generateError();
        productController.getProducts();
      },
    );

    test('TestingValueNotifier', () {
      final valueNotifier = ValueNotifier<int>(0);
      expect(valueNotifier.asStream(), emitsInOrder([0, 1, 2]));
      valueNotifier.value++;
      valueNotifier.value++;
    });
  });
}
