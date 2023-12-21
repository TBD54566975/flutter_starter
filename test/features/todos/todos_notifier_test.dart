import 'package:flutter_starter/features/todos/todos_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:services/services.dart';

import '../../helpers/mocks.dart';
import '../../helpers/riverpod_helpers.dart';

void main() {
  group('TodosNotifer', () {
    late MockTodosService todosService;
    late ProviderContainer container;

    setUp(() {
      todosService = MockTodosService();
      container = createContainer(overrides: [
        todosServiceProvider.overrideWithValue(todosService),
      ]);
    });

    test('should have correct initial state', () {
      when(() => todosService.todos).thenReturn([]);
      expect(container.read(todosProvider), []);
    });

    test('should add todos', () {
      final todo = Todo(
        title: 'title',
        description: 'description',
        completed: false,
      );

      when(() => todosService.add(todo)).thenReturn(null);
      when(() => todosService.todos).thenReturn([todo]);

      container.read(todosProvider.notifier).add(todo);

      verify(() => todosService.add(todo)).called(1);

      expect(container.read(todosProvider), [todo]);
    });

    test('should update todos', () {
      final todo = Todo(
        title: 'title',
        description: 'description',
        completed: false,
      );

      when(() => todosService.update(todo)).thenReturn(null);
      when(() => todosService.todos).thenReturn([todo]);

      container.read(todosProvider.notifier).update(todo);

      verify(() => todosService.update(todo)).called(1);

      expect(container.read(todosProvider), [todo]);
    });

    test('should remove todos', () {
      final todo = Todo(
        title: 'title',
        description: 'description',
        completed: false,
      );

      when(() => todosService.remove(todo)).thenReturn(null);
      when(() => todosService.todos).thenReturn([todo]);

      container.read(todosProvider.notifier).remove(todo);

      verify(() => todosService.remove(todo)).called(1);

      expect(container.read(todosProvider), [todo]);
    });
  });
}
