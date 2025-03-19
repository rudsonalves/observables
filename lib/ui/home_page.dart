import 'package:flutter/material.dart';
import 'package:observables/builders/stream_notifier_builder.dart';
import 'package:observables/controllers/stream_notifier_imp.dart';
import 'package:observables/core/theme/mixins/change_state_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ChangeStateMixin {
  final _counterNotifier = StreamNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Testando Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamNotifierBuilder<int>(
              listen: (context, state) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Valor emitido: $state')),
                );
              },
              streamNotifier: _counterNotifier,
              buildWhen: (previous, current) => current % 2 == 0,
              builder: (context, state) {
                return Text('Valor do contador: ${_counterNotifier.state}');
              },
            ),
            FilledButton(
              onPressed: () {
                _counterNotifier.emit(_counterNotifier.state + 1);
              },
              child: Text('Incrementa'),
            ),
          ],
        ),
      ),
    );
  }
}
