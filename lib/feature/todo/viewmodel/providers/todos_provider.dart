import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todos/todos_notifier.dart';

final todosProvider = NotifierProvider(() {
  return TodosNotifier();
});
