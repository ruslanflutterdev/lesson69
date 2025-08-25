part of 'todo_update_notifier.dart';

sealed class TodoUpdateState {}

final class TodoUpdateInitialState extends TodoUpdateState {}

final class TodoUpdateLoadedState extends TodoUpdateState {}

final class TodoUpdateExceptionState extends TodoUpdateState {}

final class TodoUpdateLoadingState extends TodoUpdateState {}
