part of 'todo_create_notifier.dart';

sealed class TodoCreateState {}

final class TodoInitialState extends TodoCreateState {}

final class TodoLoadedlState extends TodoCreateState {
}

final class TodoExceptionState extends TodoCreateState {}

final class TodoLoadingState extends TodoCreateState {}

