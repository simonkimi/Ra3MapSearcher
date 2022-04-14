import 'package:drift/drift.dart';

class PngDataTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get raw => text()();

  TextColumn get name => text()();

  TextColumn get uploader => text()();

  TextColumn get qq => text()();

  TextColumn get type => text()();

  TextColumn get players => text()();

  TextColumn get size => text()();

  TextColumn get time => text()();

  TextColumn get bv => text()();
}
