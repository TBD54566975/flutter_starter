import 'package:flutter_starter/features/app/app_tabs.dart';
import 'package:flutter_starter/features/counter/counter_page.dart';
import 'package:flutter_starter/features/todos/todos_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_helpers.dart';

void main() {
  testWidgets('should start on CounterPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      WidgetHelpers.testableWidget(child: const AppTabs()),
    );

    expect(find.byType(CounterPage), findsOneWidget);
  });

  testWidgets('should show TodosPage when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      WidgetHelpers.testableWidget(child: const AppTabs()),
    );

    await tester.tap(find.text('Todos'));
    await tester.pumpAndSettle();
    expect(find.byType(TodosPage), findsOneWidget);
  });
}
