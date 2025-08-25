import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/dependencies/root_dependency_provider.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';

part 'todo_update_state.dart';

class TodoUpdateNotifier extends Notifier<TodoUpdateState> {
  late final TodoRepository _repository;

  @override
  TodoUpdateInitialState build() {
    _repository = ref.read(dependencyProvider).todoRepository;
    return TodoUpdateInitialState();
  }

  Future<void> fetch(int id, String title) async {
    state = TodoUpdateLoadingState();
    try {
      await _repository.update(id, title);
      state = TodoUpdateLoadedState();
    } catch (err, stackTrace) {
      print(err);
      print(stackTrace);
      state = TodoUpdateExceptionState();
    }
  }
}
