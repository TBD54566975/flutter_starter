import 'package:flutter/material.dart';
import 'package:flutter_starter/features/todos/todo_form_page.dart';
import 'package:flutter_starter/features/todos/todos_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';

import '../../helpers/mocks.dart';
import '../../helpers/widget_helpers.dart';

void main() {
  late MockTodosNotifier todosNotifier;

  Widget testableWidget(Todo? todo) {
    todosNotifier = MockTodosNotifier([]);
    return WidgetHelpers.testableWidget(
        child: TodoFormPage(todo: todo),
        overrides: [
          todosProvider.overrideWith(() => todosNotifier),
        ]);
  }

  setUpAll(() {
    registerFallbackValue(Todo(
      title: 'title',
      description: 'description',
      completed: false,
    ));
  });

  group('TodoFormPage', () {
    testWidgets('should create new todo', (WidgetTester tester) async {
      await tester.pumpWidget(testableWidget(null));

      when(() => todosNotifier.add(any())).thenReturn(null);
      expect(find.text('Create todo'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField).first, "title");
      await tester.enterText(find.byType(TextFormField).last, "description");
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      verify(() => todosNotifier.add(any())).called(1);
    });

    testWidgets('should update todo', (WidgetTester tester) async {
      await tester.pumpWidget(
        testableWidget(Todo(title: 'title', description: 'description')),
      );

      when(() => todosNotifier.update(any())).thenReturn(null);
      expect(find.text('Update todo'), findsOneWidget);
      expect(find.text('title'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);

      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      verify(() => todosNotifier.update(any())).called(1);
    });

    testWidgets('should show error with empty title', (tester) async {
      await tester.pumpWidget(testableWidget(null));

      expect(find.text('Create todo'), findsOneWidget);

      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();

      expect(find.text('Title is required'), findsOneWidget);
    });
  });
}
