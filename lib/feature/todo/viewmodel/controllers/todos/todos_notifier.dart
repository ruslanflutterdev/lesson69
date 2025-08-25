import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/core/dependencies/root_dependency_provider.dart';
import 'package:lesson69/feature/todo/model/events/todo_repository_event.dart';
import 'package:lesson69/feature/todo/model/repositories/todo_repository.dart';

part 'todos_state.dart';

class TodosNotifier extends Notifier<TodosState> {
  late final TodoRepository _repository;
  late final StreamSubscription<TodoRepositoryEvent> _streamSubscription;

  @override
  TodosInitialState build() {
    _repository = ref.read(dependencyProvider).todoRepository;
    _streamSubscription = _repository.stream.listen(_listen);
    ref.onCancel(_close);
    return TodosInitialState();
  }

  void _close() {
   _streamSubscription.cancel();
  }

  void _listen(TodoRepositoryEvent event) {
    switch (event) {
      case TodoRepositoryUpdateEvent():
        _update(event);
      case TodoRepositoryCreateEvent():
        _create(event);
    }
  }

  void _update(TodoRepositoryUpdateEvent event) {
    if (state case TodosLoadedState loadedState) {
      state = TodosLoadedState(
        loadedState.todos.map((todo) {
          if (todo.id == event.todo.id) {
            return event.todo;
          }
          return todo;
        }).toList(),
      );
    }
  }

  void _create(TodoRepositoryCreateEvent event) {
    if (state case TodosLoadedState loadedState) {
      state = TodosLoadedState([...loadedState.todos, event.todo]);
    }
  }

  Future<void> fetch() async {
    state = TodosLoadingState();
    try {
      final result = await _repository.read();
      state = TodosLoadedState(result);
    } catch (err) {
      state = TodosExceptionState();
    }
  }

  @override
  bool updateShouldNotify(TodosState previous, TodosState next) {
    return true;
  }
}
