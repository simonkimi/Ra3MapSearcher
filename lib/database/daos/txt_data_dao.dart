import 'package:drift/drift.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/database/tables/txt_data_table.dart';

part 'txt_data_dao.g.dart';

@DriftAccessor(tables: [TxtDataTable])
class TxtDataDao extends DatabaseAccessor<AppDataBase> with _$TxtDataDaoMixin{
  TxtDataDao(AppDataBase attachedDatabase) : super(attachedDatabase);
}