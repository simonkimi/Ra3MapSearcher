import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/network/client.dart';
import 'package:ra3_map_searcher/utils/debug.dart';

class SearchPageController extends GetxController {
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final refreshController = RefreshController();
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
      refreshController.requestRefresh(needCallback: false);
      searchResult.clear();
      await DB().txtDataDao.clear();
      await DB().pngDataDao.clear();
      final root = await client.getData();
      await DB().pngDataDao.updatePng(root);
      await DB().txtDataDao.updateTxt(root);
      refreshController.refreshToIdle();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    refreshController.loadComplete();
  }
}
