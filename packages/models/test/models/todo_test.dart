import 'package:models/src/models/todo.dart';
import 'package:test/test.dart';

void main() {
  group('Todo', () {
    test('should create a Todo instance', () {
      final todo = Todo(
        title: 'Buy groceries',
        description: 'Buy groceries for dinner',
        completed: false,
      );

      expect(todo.id.isNotEmpty, true);
      expect(todo.title, 'Buy groceries');
      expect(todo.completed, false);
    });

    test('copyWith should return a new Todo instance', () {
      final todo = Todo(
        title: 'Buy groceries',
        description: 'Buy groceries for dinner',
        completed: false,
      );

      final newTodo = todo.copyWith(
        completed: true,
      );

      expect(newTodo.id, todo.id);
      expect(newTodo.title, todo.title);
      expect(newTodo.description, todo.description);
      expect(newTodo.completed, true);
    });
  });
}
