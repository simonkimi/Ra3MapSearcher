import 'dart:io';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ra3_map_searcher/utils/rx_watcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  final RxString documentDir = ''.obs;

  late final DbCacheStore dbCacheStore;
  late final CacheOptions cacheOptions;

  Future<void> init() async {
    documentDir.watch('documentDir', '');

    if (documentDir.value.isEmpty) {
      documentDir.value = await getDocumentDir();
    }

    dbCacheStore = DbCacheStore(
      databasePath: p.join(documentDir.value, 'cache'),
    );

    cacheOptions = CacheOptions(
      store: dbCacheStore,
      policy: CachePolicy.noCache,
      maxStale: const Duration(days: 30),
    );
  }

  Future<String> getDocumentDir() async {
    final path = Platform.isWindows
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();

    final sp = await SharedPreferences.getInstance();
    await sp.setString('documentDir', path.path);
    return path.path;
  }
}
