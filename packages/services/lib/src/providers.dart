import 'package:riverpod/riverpod.dart';
import 'package:services/services.dart';

final todosServiceProvider = Provider<TodosService>((ref) => TodosService());

List<Override> serviceOverrides() => [];
