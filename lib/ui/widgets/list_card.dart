import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:ra3_map_searcher/database/database.dart';
import 'package:ra3_map_searcher/ui/themes/colors.dart';
import 'package:ra3_map_searcher/ui/widgets/badge.dart';
import 'package:ra3_map_searcher/ui/widgets/image_provider.dart';

class ListExtendedCard extends StatelessWidget {
  const ListExtendedCard({
    Key? key,
    required this.model,
    required this.onTap,
    required this.dio,
  }) : super(key: key);

  final PngDataTableData model;
  final VoidCallback onTap;
  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: IntrinsicHeight(
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
      ],
    );
  }

  Widget _buildLeftImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: 130,
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
        child: Stack(
          children: [
            ExtendedImage(
              image: DioImageProvider(
                url: 'static/map/${model.raw}',
                dio: dio,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: CupertinoColors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    model.players.endsWith('人') ? model.players : '${model.players}人',
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
          Column(
            children: [
              Badge(
                text: model.type,
                fontSize: 12,
                color: CupertinoColors.systemBlue,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                model.size,
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
          )
        ],
      ),
    );
  }
}
