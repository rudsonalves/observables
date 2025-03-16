import 'package:flutter/widgets.dart';
import 'package:observables/controllers/state_observable.dart';

import '../entities/product_entity.dart';
import '../states/base_state.dart';

@visibleForTesting
class ProductController extends StateObservable<BaseState> {
  ProductController() : super(InitialState());

  void getProducts() {
    state = LoadingState();

    state = SuccessState(
      data: [
        Product(id: 1, name: 'Mesa'),
        Product(id: 2, name: 'Cadeira'),
        Product(id: 3, name: 'Estante'),
        Product(id: 4, name: 'Armário'),
      ],
    );
  }

  void generateError() {
    state = LoadingState();

    try {
      throw Exception('unknow error!');
      // data: [
      //   Product(id: 1, name: 'Mesa'),
      //   Product(id: 2, name: 'Cadeira'),
      //   Product(id: 3, name: 'Estante'),
      //   Product(id: 4, name: 'Armário'),
      // ],
    } catch (err) {
      state = ErrorState(message: err.toString());
    }
  }
}
