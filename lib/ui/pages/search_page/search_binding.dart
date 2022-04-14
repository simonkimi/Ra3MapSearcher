import 'package:get/get.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_page_controller.dart';

class SearchPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchPageController>(SearchPageController());
  }
}
