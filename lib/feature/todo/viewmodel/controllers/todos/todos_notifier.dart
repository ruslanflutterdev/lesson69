import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/core/dependensies/root_dependency_provider.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';
part 'todos_state.dart';

class TodosNotifier extends Notifier<TodosState> {
  late final TodoRepository _repository;

  @override
  TodosInitialState build() {
    _repository = ref.read(dependencyProvider).todoRepository;
    return TodosInitialState();
  }

  Future<void> fetch() async {
    state = TodosLoadingState();
    try {
      final result = await _repository.read();
      state = TodosLoadedlState(result);
    } catch (err) {
      state = TodosExceptionState();
    }
  }
}

