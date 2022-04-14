import 'package:flutter/cupertino.dart';
import 'package:ra3_map_searcher/data/constant.dart';

import 'cupertino_divider.dart';

class SliverPullToRefresh extends StatelessWidget {
  const SliverPullToRefresh({
    Key? key,
    this.onRefresh,
    this.extraHeight = 0,
  }) : super(key: key);

  final RefreshCallback? onRefresh;
  final double extraHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top +
            kCupertinoNavigatorBar +
            extraHeight +
            5,
      ),
      sliver: CupertinoSliverRefreshControl(
        refreshIndicatorExtent: 50,
        refreshTriggerPullDistance: 100,
        onRefresh: () async {
          if (onRefresh != null) {
            await onRefresh!();
          }
        },
      ),
    );
  }
}

class SliverChildDividerBuilderDelegate extends SliverChildBuilderDelegate {
  SliverChildDividerBuilderDelegate({
    required NullableIndexedWidgetBuilder builder,
    required this.itemCount,
    this.divider,
  }) : super(builder, childCount: itemCount * 2 - 1);

  final Widget? divider;
  final int itemCount;

  @override
  Widget? build(BuildContext context, int index) {
    if (index.isOdd) {
      return divider ??
          const Padding(
            padding: EdgeInsets.only(
              right: 5,
              left: 124,
              // left: 5,
            ),
            child: CupertinoDivider(height: 5),
          );
    }
    if (index ~/ 2 >= itemCount || index ~/ 2 < 0) {
      return null;
    }
    return super.build(context, index ~/ 2);
  }
}