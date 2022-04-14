import 'package:drift/drift.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/database/tables/Png_data_table.dart';

part 'png_data_dao.g.dart';

@DriftAccessor(tables: [PngDataTable])
class PngDataDao extends DatabaseAccessor<AppDataBase> with _$PngDataDaoMixin {
  PngDataDao(AppDataBase attachedDatabase) : super(attachedDatabase);
}
