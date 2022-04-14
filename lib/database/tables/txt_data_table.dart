import 'package:drift/drift.dart';

class TxtDataTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}
