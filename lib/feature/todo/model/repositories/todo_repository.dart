import 'package:drift/drift.dart';
import 'package:lesson69/core/database/database.dart';

class TodoRepository {
  final AppDatabase _database;

  TodoRepository(this._database);

  Future<TodoTableData> create(String title) async {
    final todo = TodoTableCompanion.insert(title: title);

    final id = await _database.into(_database.todoTable).insert(todo);

    return readById(id);
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
    final updateTodo = TodoTableCompanion.insert(id: Value(id), title: title);

    await (_database.update(
      _database.todoTable,
    )..where((todo) => todo.id.equals(id))).replace(updateTodo);
    return readById(id);
  }

  void delete(int id) async {
    await (_database.delete(
      _database.todoTable,
    )..where((todo) => todo.id.equals(id))).go();
  }
}
