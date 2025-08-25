import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todo_create/todo_create_notifier.dart';

final todoCreateProvider = NotifierProvider<TodoCreateNotifier, TodoCreateState>(() {
  return TodoCreateNotifier();
});
