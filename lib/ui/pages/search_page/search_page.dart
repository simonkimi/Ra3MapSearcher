import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_page_controller.dart';
import 'package:ra3_map_searcher/ui/widgets/cupertino_app_bar.dart';
import 'package:ra3_map_searcher/ui/widgets/cupertino_divider.dart';
import 'package:ra3_map_searcher/ui/widgets/dialogs.dart';
import 'package:ra3_map_searcher/ui/widgets/list_card.dart';
import 'package:ra3_map_searcher/ui/widgets/slivers.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: CupertinoPageScaffold(
        child: CupertinoAppBar(
          title: '搜索地图',
          actions: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              child: const Icon(CupertinoIcons.refresh),
              onPressed: () {
                showCupertinoConfirmDialog(
                    context: context,
                    content: '是否更新数据库?',
                    showCancel: true)
                    .then((value) {
                  if (value == true) {
                    controller.reloadDatabase();
                  }
                });
              },
            )
          ],
          tabBarHeight: 40,
          tabBar: _buildSearchInput(context),
          automaticallyImplyLeading: false,
          child: CupertinoScrollbar(
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: false,
              enablePullUp: false,
              onLoading: controller.onLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomScrollView(
                  slivers: [
                    SliverPullToRefresh(
                      extraHeight: 45,
                      onRefresh: controller.onRefresh,
                    ),
                    SliverList(
                        delegate: SliverChildDividerBuilderDelegate(
                          itemCount: controller.searchResult.length,
                          divider: const Padding(
                            padding: EdgeInsets.only(
                              right: 5,
                              left: 140,
                              // left: 5,
                            ),
                            child: CupertinoDivider(height: 5),
                          ),
                          builder: (context, index) {
                            return ListExtendedCard(
                              model: controller.searchResult[index],
                              onTap: () {},
                              dio: controller.client.dio,
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (controller.isSearchMode.value && controller.searchResult.isNotEmpty) {
      controller.isSearchMode.value = false;
      controller.focusNode.unfocus();
      return false;
    }

    if (DateTime.now().millisecondsSinceEpoch - controller.lastPressBack >
        1000) {
      controller.lastPressBack = DateTime.now().millisecondsSinceEpoch;
      BotToast.showText(text: '再按一次退出应用');
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
