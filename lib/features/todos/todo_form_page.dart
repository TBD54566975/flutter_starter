import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_starter/features/todos/todos_notifier.dart';
import 'package:flutter_starter/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';

class TodoFormPage extends HookConsumerWidget {
  final Todo? todo;
  final bool isNew;

  const TodoFormPage({this.todo, super.key}) : isNew = todo == null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useState(todo?.title);
    final description = useState(todo?.description);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            isNew ? Loc.of(context).createTodo : Loc.of(context).updateTodo),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
                      autofocus: true,
                      initialValue: title.value,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => title.value = value,
                      decoration: InputDecoration(
                        labelText: Loc.of(context).title,
                      ),
                    ),
                    TextFormField(
                      initialValue: description.value,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) => description.value = value,
                      decoration: InputDecoration(
                        labelText: Loc.of(context).description,
                      ),
                      maxLines: null,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    child: Text(Loc.of(context).save),
                    onPressed: () =>
                        _save(context, ref, title.value, description.value),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(
      BuildContext context, WidgetRef ref, String? title, String? description) {
    if (title == null || title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Loc.of(context).titleRequired)),
      );
      return;
    }

    if (isNew) {
      ref.read(todosProvider.notifier).add(
            Todo(
              title: title,
              description: description,
            ),
          );
    } else {
      ref.read(todosProvider.notifier).update(
            todo!.copyWith(
              title: title,
              description: description,
            ),
          );
    }

    Navigator.of(context).pop();
  }
}
