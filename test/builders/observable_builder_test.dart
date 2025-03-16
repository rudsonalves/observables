import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../untestable/widgets/counter_widget.dart';

void main() {
  group('Should test ObservableBuilder', () {
    testWidgets('Should test increment Widget', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const CounterWidget()));

      final findTest = find.text('Valor do counter: 0');

      final findButton = find.byKey(incrementButtonKey);

      expect(findTest, findsOneWidget);
      expect(findButton, findsOneWidget);

      await tester.tap(findButton);
      await tester.pump();

      final nextFindTest = find.text('Valor do counter: 1');
      expect(nextFindTest, findsOneWidget);

      await tester.tap(findButton);
      await tester.pump();

      final nextFindTest2 = find.text('Valor do counter: 2');
      expect(nextFindTest2, findsOneWidget);
    });
  });
}
