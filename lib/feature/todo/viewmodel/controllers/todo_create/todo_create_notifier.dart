import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/dependencies/root_dependency_provider.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';

part 'todo_create_state.dart';

class TodoCreateNotifier extends Notifier<TodoCreateState> {
  late final TodoRepository _repository;

  @override
  TodoCreateInitialState build() {
    _repository = ref.read(dependencyProvider).todoRepository;
    return TodoCreateInitialState();
  }

  Future<void> fetch(String title) async {
    state = TodoCreateLoadingState();
    try {
      await _repository.create(title);
      state = TodoCreateLoadedState();
    } catch (err) {
      state = TodoCreateExceptionState();
    }
  }
}
