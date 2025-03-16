import 'package:flutter/material.dart';
import 'package:observables/builders/observable_builder.dart';

import '../controllers/observable_counter.dart';

@visibleForTesting
const incrementButtonKey = Key('increment_key');

@visibleForTesting
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final _counter = ObservableCounter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ObservableBuilder(
          observable: _counter,
          builder: (context, _) {
            return Text('Valor do counter: ${_counter.counter}');
          },
        ),
        ElevatedButton(
          key: incrementButtonKey,
          onPressed: _counter.increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
