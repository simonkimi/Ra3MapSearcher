import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/network/client.dart';
import 'package:ra3_map_searcher/utils/debug.dart';

class SearchPageController extends GetxController {
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final inputController = TextEditingController();

  var lastPressBack = DateTime.now().millisecondsSinceEpoch;

  final isLoading = false.obs;
  final isSearchMode = true.obs;

  final searchResult = RxList<PngDataTableData>();

  final client = Client();

  Future<void> onSearchSubmit(String value) async {
    final time = TimeLine();
    searchResult.clear();
    searchResult.addAll(await DB().pngDataDao.search(value));
    time.getRunTime();
  }

  Future<void> reloadDatabase() async {
    try {
      searchResult.clear();
      await DB().txtDataDao.clear();
      await DB().pngDataDao.clear();
      final root = await client.getData();
      await DB().pngDataDao.updatePng(root);
      await DB().txtDataDao.updateTxt(root);
    } catch (e) {
      logger.e(e);
    }
  }
}
