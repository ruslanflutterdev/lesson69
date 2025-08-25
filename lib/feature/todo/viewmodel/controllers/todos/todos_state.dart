part of 'todos_notifier.dart';

sealed class TodosState {}

final class TodosInitialState extends TodosState {}

final class TodosLoadedState extends TodosState {
  final List<TodoTableData> todos;

  TodosLoadedState(this.todos);
}

final class TodosExceptionState extends TodosState {}

final class TodosLoadingState extends TodosState {}
