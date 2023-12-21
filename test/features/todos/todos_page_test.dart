import 'package:flutter/material.dart';
import 'package:flutter_starter/features/todos/todo_form_page.dart';
import 'package:flutter_starter/features/todos/todos_notifier.dart';
import 'package:flutter_starter/features/todos/todos_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';

import '../../helpers/mocks.dart';
import '../../helpers/widget_helpers.dart';

void main() {
  late MockTodosNotifier todosNotifier;

  Widget testableWidget(List<Todo> todos) {
    todosNotifier = MockTodosNotifier(todos);
    return WidgetHelpers.testableWidget(child: const TodosPage(), overrides: [
      todosProvider.overrideWith(() => todosNotifier),
    ]);
  }

  testWidgets('should show empty state', (WidgetTester tester) async {
    await tester.pumpWidget(testableWidget([]));

    expect(find.text('No todos'), findsOneWidget);
  });

  testWidgets('should show todos', (WidgetTester tester) async {
    final todo = Todo(
      title: 'title',
      description: 'description',
      completed: false,
    );
    await tester.pumpWidget(testableWidget([todo]));

    expect(find.text(todo.title), findsOneWidget);
    expect(find.text(todo.description!), findsOneWidget);
  });

  testWidgets('should mark todo as completed when checked',
      (WidgetTester tester) async {
    final todo = Todo(
      title: 'title',
      description: 'description',
      completed: false,
    );
    await tester.pumpWidget(testableWidget([todo]));

    when(() => todosNotifier.update(todo.copyWith(completed: true)))
        .thenReturn(null);

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    verify(() => todosNotifier.update(todo.copyWith(completed: true)))
        .called(1);
  });

  testWidgets('should delete todo', (WidgetTester tester) async {
    final todo = Todo(
      title: 'title',
      description: 'description',
      completed: false,
    );
    await tester.pumpWidget(testableWidget([todo]));

    when(() => todosNotifier.remove(todo)).thenReturn(null);
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    verify(() => todosNotifier.remove(todo)).called(1);
  });

  testWidgets('should show TodoForm for editing Todo',
      (WidgetTester tester) async {
    final todo = Todo(
      title: 'title',
      description: 'description',
      completed: false,
    );
    await tester.pumpWidget(testableWidget([todo]));

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();
    expect(find.byType(TodoFormPage), findsOneWidget);
  });

  testWidgets('should show TodoForm for new Todo', (WidgetTester tester) async {
    await tester.pumpWidget(testableWidget([]));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byType(TodoFormPage), findsOneWidget);
  });
}
