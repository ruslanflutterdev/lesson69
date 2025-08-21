part of 'todos_notifier.dart';

sealed class TodosState {}

final class TodosInitialState extends TodosState {}

final class TodosLoadedlState extends TodosState {
  final List<TodoTableData> todos;

  TodosLoadedlState(this.todos);
}

final class TodosExceptionState extends TodosState {}

final class TodosLoadingState extends TodosState {}
