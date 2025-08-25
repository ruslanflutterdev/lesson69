import 'package:depend/depend.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/core/dependencies/root_dependency_container.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';

class RootDependencyFactory extends DependencyFactory<RootDependencyContainer> {
  @override
  RootDependencyContainer create() {
    final database = AppDatabase();

    return RootDependencyContainer(
      database: database,
      todoRepository: TodoRepository(database),
    );
  }
}
