import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todo_update/todo_update_notifier.dart';

final todoUpdateProvider = NotifierProvider<TodoUpdateNotifier, TodoUpdateState>(() {
  return TodoUpdateNotifier();
});
