import 'package:models/models.dart';
import 'package:services/services.dart';
import 'package:test/test.dart';

void main() {
  late TodosService todosService;

  setUp(() {
    todosService = TodosService();
  });

  group('TodosService', () {
    test('should add a todo', () {
      final todo = Todo(
        title: 'Buy groceries',
        description: 'Buy groceries for dinner',
        completed: false,
      );

      todosService.add(todo);

      expect(todosService.todos.length, 1);
      expect(todosService.todos.first, todo);
    });

    test('should update a todo', () {
      final todo = Todo(
        title: 'Buy groceries',
        description: 'Buy groceries for dinner',
        completed: false,
      );

      todosService.add(todo);

      final newTodo = todo.copyWith(
        completed: true,
      );

      todosService.update(newTodo);

      expect(todosService.todos.length, 1);
      expect(todosService.todos.first, newTodo);
    });

    test('should remove a todo', () {
      final todo = Todo(
        title: 'Buy groceries',
        description: 'Buy groceries for dinner',
        completed: false,
      );

      todosService.add(todo);

      todosService.remove(todo);

      expect(todosService.todos.length, 0);
    });
  });
}
