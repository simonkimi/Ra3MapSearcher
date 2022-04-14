import 'package:drift/drift.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/database/tables/png_data_table.dart';
import 'package:ra3_map_searcher/network/entities.json.dart';

part 'png_data_dao.g.dart';

@DriftAccessor(tables: [PngDataTable])
class PngDataDao extends DatabaseAccessor<AppDataBase> with _$PngDataDaoMixin {
  PngDataDao(AppDataBase attachedDatabase) : super(attachedDatabase);

  Future<void> clear() => delete(pngDataTable).go();

  Future<List<PngDataTableData>> search(String value) async {
    if (value.isEmpty) {
      return (select(pngDataTable)).get();
    }

    return (select(pngDataTable)..where((tbl) => tbl.name.contains(value)))
        .get();
  }

  Future<void> updatePng(DataRoot root) async {
    await batch((batch) {
      batch.insertAll(
          pngDataTable,
          root.pngData.map((e) => e.split('&!')).map(
                (e) => PngDataTableCompanion.insert(
                  raw: e.join('&!'),
                  name: e[0],
                  uploader: e[1],
                  qq: e[2],
                  type: e[3],
                  players: e[4],
                  size: e[5],
                  time: e[6],
                  bv: e[7],
                ),
              ));
    });
  }
}
