import 'package:depend/depend.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';

class RootDependencyContainer extends DependencyContainer {
  final AppDatabase database;
  final TodoRepository todoRepository;

  RootDependencyContainer({
    required this.database,
    required this.todoRepository,
  });
}
