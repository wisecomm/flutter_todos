import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import './todo_entity.dart';

@immutable
class Todo extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(this.task, this.id, {this.complete = false, String note = ''})
      : this.note = note ?? '',
        super([complete, id, note, task]);

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(
      task ?? this.task,
      id ?? this.id,
      complete: complete ?? this.complete,
      note: note ?? this.note,
    );
  }

  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, note: $note, id: $id }';
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, complete);
  }

  static Todo fromEntity(TodoEntity entity) {
    return Todo(
      entity.task,
      entity.id,
      complete: entity.complete ?? false,
      note: entity.note,
    );
  }
  
}
