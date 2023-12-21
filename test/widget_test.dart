import 'package:flutter_starter/features/app/app.dart';
import 'package:flutter_starter/features/counter/counter_page.dart';
import 'package:flutter_starter/features/todos/todos_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/widget_helpers.dart';

void main() {
  testWidgets('App starts on CounterPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      WidgetHelpers.testableWidget(child: const App()),
    );

    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(TodosPage), findsNothing);
  });
}
