import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ra3_map_searcher/utils/rx_watcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  final RxString documentDir = ''.obs;


  Future<void> init() async {
    documentDir.watch('documentDir', '');

    if (documentDir.value.isEmpty) {
      documentDir.value = await getDocumentDir();
    }
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
