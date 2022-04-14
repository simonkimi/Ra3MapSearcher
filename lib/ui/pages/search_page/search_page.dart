import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_page_controller.dart';
import 'package:ra3_map_searcher/ui/widgets/cupertino_app_bar.dart';

class SearchPage extends GetView<SearchPageController> {
  SearchPage({Key? key}) : super(key: key);

  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        child: CupertinoAppBar(
          title: '搜索地图',
          leading: _buildLeading(context),
          tabBar: _buildSearchInput(context),
          child: ListView(),
        ),
      ),
    );
  }

  CupertinoBackLeading _buildLeading(BuildContext context) {
    return CupertinoBackLeading(
      onPressed: () async {
        _onWillPop().then((value) {
          if (value) {
            Navigator.of(context).pop();
          }
        });
      },
    );
  }

  Future<bool> _onWillPop() async {
    if (controller.isSearchMode.value && controller.items.isNotEmpty) {
      controller.isSearchMode.value = false;
      controller.focusNode.unfocus();
      return false;
    }
    return true;
  }

  Widget _buildSearchInput(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: CupertinoTextField(
          controller: controller.textController,
          focusNode: controller.focusNode,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(50),
          ),
          placeholder: '搜索',
          placeholderStyle: TextStyle(
            color: CupertinoColors.placeholderText.resolveFrom(context),
          ),
          clearButtonMode: OverlayVisibilityMode.editing,
          prefix: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 18,
              height: 18,
              child: Obx(() => controller.isLoading.value
                  ? const CupertinoActivityIndicator()
                  : const Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.systemGrey,
                      size: 18,
                    )),
            ),
          ),
          onSubmitted: controller.onSearchSubmit,
          onTap: () {
            controller.isSearchMode.value = true;
          },
        ),
      ),
    );
  }
}
