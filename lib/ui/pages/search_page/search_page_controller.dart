import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final focusNode = FocusNode();
  final textController = TextEditingController();

  final isLoading = false.obs;
  final isSearchMode = true.obs;

  var items = RxList();

  Future<void> onSearchSubmit(String value) async {

  }
}
