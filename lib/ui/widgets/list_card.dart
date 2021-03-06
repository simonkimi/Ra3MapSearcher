import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/network/client.dart';
import 'package:ra3_map_searcher/ui/themes/colors.dart';
import 'package:ra3_map_searcher/ui/widgets/badge.dart';


class ListExtendedCard extends StatelessWidget {
  const ListExtendedCard({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  final PngDataTableData model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          children: [
            _buildLeftImage(context),
            const SizedBox(width: 3),
            _buildRightInfo(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildRightInfo(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRightHeader(context),
            const Expanded(child: SizedBox()),
            _buildTile(context),
          ],
        ),
      ),
    );
  }

  Column _buildRightHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          model.name,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: FixColor.title.resolveFrom(context), fontSize: 15),
        ),
        Text(
          model.uploader,
          style: TextStyle(
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 3),
        _buildType(context),
      ],
    );
  }

  Widget _buildType(BuildContext context) {
    return Wrap(
      spacing: 3,
      runSpacing: 3,
      children: [
        Badge(
          text:
              model.players.endsWith('???') ? model.players : '${model.players}???',
          fontSize: 12,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          color: CupertinoColors.systemTeal,
        ),
        ...model.type.split('&').map((type) {
          return Badge(
            text: type,
            fontSize: 12,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            color: typeColor(type),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildLeftImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isDarkMode(context)
                  ? CupertinoColors.white.withOpacity(0.2)
                  : CupertinoColors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: ExtendedImage.network(
          '${baseUrl}static/map/${model.raw}',
          cache: true,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return const CupertinoActivityIndicator();
              case LoadState.completed:
              case LoadState.failed:
                return null;
            }
          },
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            model.size.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              height: 1.1,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
          Text(
            model.time,
            style: TextStyle(
              fontSize: 12.5,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
            ),
          ),
        ],
      ),
    );
  }
}
