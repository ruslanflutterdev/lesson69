import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/dependensies/root_dependency_provider.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';
part 'todo_create_state.dart';

class TodoCreateNotifier extends Notifier<TodoCreateState> {
  late final TodoRepository _repository;

  @override
  TodoInitialState build() {
    _repository = ref.read(dependencyProvider).todoRepository;
    return TodoInitialState();
  }

  Future<void> fetch(String title) async {
    state = TodoLoadingState();
    try {
      await _repository.create(title);
      state = TodoLoadedlState();
    } catch (err) {
      state = TodoExceptionState();
    }
  }
}

