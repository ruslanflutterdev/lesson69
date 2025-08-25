part of 'todo_create_notifier.dart';

sealed class TodoCreateState {}

final class TodoCreateInitialState extends TodoCreateState {}

final class TodoCreateLoadedState extends TodoCreateState {}

final class TodoCreateExceptionState extends TodoCreateState {}

final class TodoCreateLoadingState extends TodoCreateState {}
