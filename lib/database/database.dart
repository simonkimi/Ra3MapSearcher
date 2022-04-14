import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ra3_map_searcher/database/daos/png_data_dao.dart';
import 'package:ra3_map_searcher/database/daos/txt_data_dao.dart';
import 'package:ra3_map_searcher/database/tables/png_data_table.dart';
import 'package:ra3_map_searcher/database/tables/txt_data_table.dart';

part 'database.g.dart';

DynamicLibrary openOnWindows() {
  final exeDir = File(Platform.resolvedExecutable).parent;
  final libraryNextToExe = File(p.join(exeDir.path, 'libs', 'sqlite3.dll'));
  if (libraryNextToExe.existsSync()) {
    return DynamicLibrary.open(libraryNextToExe.path);
  }
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File(p.join(scriptDir.path, 'sqlite3.dll'));
  return DynamicLibrary.open(libraryNextToScript.path);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File(
        p.join((await getApplicationDocumentsDirectory()).path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [TxtDataTable, PngDataTable],
  daos: [TxtDataDao, PngDataDao],
)
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

class DB {
  factory DB() => _db;

  DB._();

  static final DB _db = DB._();
  final AppDataBase _database = AppDataBase();

  PngDataDao get pngDataDao => _database.pngDataDao;

  TxtDataDao get txtDataDao => _database.txtDataDao;
}
