import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:services/services.dart';

final todosProvider =
    NotifierProvider<TodosNotifier, List<Todo>>(TodosNotifier.new);

class TodosNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return service.todos;
  }

  TodosService get service => ref.read(todosServiceProvider);
  List<Todo> get serviceTodos => List.from(service.todos);

  void add(Todo todo) {
    service.add(todo);
    state = serviceTodos;
  }

  void update(Todo todo) {
    service.update(todo);
    state = serviceTodos;
  }

  void remove(Todo todo) {
    service.remove(todo);
    state = serviceTodos;
  }
}
