import 'package:flutter/material.dart';
import 'package:flutter_starter/features/todos/todo_form_page.dart';
import 'package:flutter_starter/features/todos/todos_notifier.dart';
import 'package:flutter_starter/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';

class TodosPage extends HookConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(title: Text(Loc.of(context).todos)),
      body: todos.isEmpty
          ? Center(child: Text(Loc.of(context).noTodos))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    visualDensity: VisualDensity.compact,
                    value: todo.completed,
                    onChanged: (value) => ref
                        .read(todosProvider.notifier)
                        .update(todo.copyWith(completed: value)),
                  ),
                  title: Text(todo.title),
                  subtitle:
                      todo.description != null ? Text(todo.description!) : null,
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                      onPressed: () => _showTodoForm(context, todo),
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () =>
                          ref.read(todosProvider.notifier).remove(todo),
                      icon: const Icon(Icons.delete),
                    ),
                  ]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'todos',
        onPressed: () => _showTodoForm(context, null),
        tooltip: Loc.of(context).increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showTodoForm(BuildContext context, Todo? todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TodoFormPage(todo: todo),
        fullscreenDialog: true,
      ),
    );
  }
}
