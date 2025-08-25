import 'package:lesson69/core/database/database.dart';

sealed class TodoRepositoryEvent {}

final class TodoRepositoryUpdateEvent extends TodoRepositoryEvent {
  final TodoTableData todo;

  TodoRepositoryUpdateEvent(this.todo);
}

final class TodoRepositoryCreateEvent extends TodoRepositoryEvent {
  final TodoTableData todo;

  TodoRepositoryCreateEvent(this.todo);
}
