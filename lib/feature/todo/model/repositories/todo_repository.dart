import 'dart:async';

import 'package:drift/drift.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/feature/todo/model/events/todo_repository_event.dart';

class TodoRepository {
  TodoRepository(this._database) : _streamController = StreamController();

  final AppDatabase _database;
  final StreamController<TodoRepositoryEvent> _streamController;
  Stream<TodoRepositoryEvent> get stream => _streamController.stream;

  Future<TodoTableData> create(String title) async {
    final todoCompanion = TodoTableCompanion.insert(title: title);

    final id = await _database.into(_database.todoTable).insert(todoCompanion);

    final todo = await readById(id);

    _streamController.add(TodoRepositoryCreateEvent(todo));

    return todo;
  }

  Future<TodoTableData> readById(int id) async {
    return await (_database.select(
      _database.todoTable,
    )..where((todo) => todo.id.equals(id))).getSingle();
  }

  Future<List<TodoTableData>> read() async {
    return await _database.select(_database.todoTable).get();
  }

  Future<TodoTableData> update(int id, String title) async {
    final updatedTodo = TodoTableCompanion.insert(id: Value(id), title: title);

    await _database.update(_database.todoTable).replace(updatedTodo);


    final todo = await readById(id);

    _streamController.add(TodoRepositoryUpdateEvent(todo));

    return todo;
  }

  Future<void> delete(int id) async {
    await (_database.delete(
      _database.todoTable,
    )..where((todo) => todo.id.equals(id))).go();
  }
}
