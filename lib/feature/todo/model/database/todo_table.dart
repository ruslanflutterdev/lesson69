import 'package:drift/drift.dart';

class TodoTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 3, max: 10)();
}
