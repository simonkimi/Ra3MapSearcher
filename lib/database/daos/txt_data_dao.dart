import 'package:drift/drift.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/database/tables/txt_data_table.dart';
import 'package:ra3_map_searcher/network/entities.json.dart';

part 'txt_data_dao.g.dart';

@DriftAccessor(tables: [TxtDataTable])
class TxtDataDao extends DatabaseAccessor<AppDataBase> with _$TxtDataDaoMixin {
  TxtDataDao(AppDataBase attachedDatabase) : super(attachedDatabase);

  Future<void> clear() => delete(txtDataTable).go();

  Future<void> updateTxt(DataRoot root) async {
    await batch((batch) {
      batch.insertAll(txtDataTable,
          root.txtData.map((e) => TxtDataTableCompanion.insert(name: e)));
    });
  }
}
