import 'package:flutter/material.dart';
import 'package:observables/app.dart';
import 'package:observables/builders/observable_builder.dart';
import 'package:observables/builders/observable_builder_state.dart';
import 'package:observables/classes/counter_state.dart';
import 'package:observables/controllers/state_observable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counter1 = CounterState();
  final counter2 = StateObservable(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ObservableBuilder(
              observable: counter1,
              builder:
                  (context, _) =>
                      Text('Valor do estado 1: ${counter1.counter}'),
            ),
            ElevatedButton(
              onPressed: counter1.increment,
              child: Text('Incrementa'),
            ),
            ObservableBuilderState(
              stateObservable: counter2,
              listener: (context, state) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Valor do contador é $state'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              buildWhen: (oldState, newState) => newState % 2 == 0,
              builder: (context, state, _) => Text('Valor do estado 2: $state'),
            ),
            ElevatedButton(
              onPressed: () => counter2.state++,
              child: Text('Incrementa'),
            ),
            Text('Troque o tema'),
            Switch(
              value: appTheme.isDark,
              onChanged: (value) {
                appTheme.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
