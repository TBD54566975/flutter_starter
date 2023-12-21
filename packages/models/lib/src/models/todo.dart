import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final bool completed;

  Todo({
    required this.title,
    required this.description,
    this.completed = false,
  }) : id = Uuid().v4();

  Todo._internal({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  Todo copyWith({
    String? title,
    String? description,
    bool? completed,
  }) {
    return Todo._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, completed: $completed}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          completed == other.completed;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ description.hashCode ^ completed.hashCode;
}
