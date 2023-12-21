import 'package:flutter_starter/features/todos/todos_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:services/services.dart';

class MockTodosService extends Mock implements TodosService {}

class MockTodosNotifier extends Notifier<List<Todo>>
    with Mock
    implements TodosNotifier {
  final List<Todo> initialState;
  MockTodosNotifier(this.initialState);

  @override
  List<Todo> build() => initialState;
}
