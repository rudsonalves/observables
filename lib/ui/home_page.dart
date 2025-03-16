import 'package:flutter/material.dart';
import 'package:observables/app.dart';
import 'package:observables/classes/counter_state.dart';
import 'package:observables/controllers/state_observable.dart';
import 'package:observables/core/theme/mixins/change_state_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ChangeStateMixin {
  final counter1 = CounterState();
  final counter2 = StateObservable(0);
  late final StateObservable<int> counter3;

  @override
  void initState() {
    useChangeState(counter1);
    useChangeState(counter2);
    counter3 = userStateObservable(0);
    super.initState();
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
            Text('Valor do contador é ${counter1.counter}'),
            ElevatedButton(
              onPressed: () => counter1.increment(),
              child: Text('Incrementa'),
            ),
            Text('Valor do contador é ${counter2.state}'),
            ElevatedButton(
              onPressed: () => counter2.state++,
              child: Text('Incrementa'),
            ),
            Text('Valor do contador é ${counter3.state}'),
            ElevatedButton(
              onPressed: () => counter3.state++,
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
