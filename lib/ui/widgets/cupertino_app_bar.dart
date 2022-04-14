import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:ra3_map_searcher/data/constant.dart';
import 'package:ra3_map_searcher/ui/themes/colors.dart';

class CupertinoBackLeading extends StatelessWidget {
  const CupertinoBackLeading({
    Key? key,
    this.title,
    this.onPressed,
    this.color,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Row(
        children: [
          Icon(CupertinoIcons.back, color: color),
          if (title != null) Text(title!),
        ],
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}

class CupertinoAppBar extends StatefulWidget {
  const CupertinoAppBar({
    Key? key,
    this.title,
    required this.child,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.automaticallyImplyLeading = true,
    this.tabBar,
    this.tabBarHeight,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget child;
  final EdgeInsets padding;
  final bool automaticallyImplyLeading;
  final Widget? tabBar;
  final double? tabBarHeight;

  @override
  _CupertinoAppBarState createState() => _CupertinoAppBarState();
}

class _CupertinoAppBarState extends State<CupertinoAppBar>
    with TickerProviderStateMixin {
  late final _translateController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final _translateAnimation = CurvedAnimation(
    parent: _translateController,
    curve: Curves.linear,
  );

  double _lastPixel = 0.0;

  void _setTranslateCurve(Curve curve) {
    _translateAnimation.curve = curve;
  }

  void _fastReverse() {
    _setTranslateCurve(Curves.easeInOutCubic);
    _translateController.duration = const Duration(milliseconds: 200);
    _translateController.reverse();
    _translateController.duration = const Duration(seconds: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildChild(context),
        _buildAppBar(context),
      ],
    );
  }

  SlideTransition _buildAppBar(BuildContext context) {
    return SlideTransition(
      position: Tween(
        begin: Offset.zero,
        end: const Offset(0.0, -1.0),
      ).animate(_translateAnimation),
      child: _buildBarGroup(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return NotificationListener<AppBarScrollNotification>(
      onNotification: (notification) {
        final pixel = notification.metrics.pixels;
        final didReleasePointer = pixel == _lastPixel;

        if (didReleasePointer) {
          _setTranslateCurve(Curves.easeInOutCubic);
          final hide = pixel > 0.0 && _translateController.value > 0.5;
          hide
              ? _translateController.forward()
              : _translateController.reverse();
        } else {
          _setTranslateCurve(Curves.linear);
          final delta = pixel - _lastPixel;
          _translateController.value += delta /
              (kCupertinoNavigatorBar +
                  (widget.tabBar != null
                      ? widget.tabBarHeight ?? kCupertinoTabBarHeight
                      : 0.0) +
                  MediaQuery.of(context).padding.top);
          _lastPixel = pixel;
        }

        _lastPixel = pixel;
        return false;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is AppBarScrollNotification) return false;
          _fastReverse();
          return false;
        },
        child: widget.child,
      ),
    );
  }

  Widget _buildBarGroup(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDarkMode(context)
                    ? const Color(0xff2b2b2b)
                    : const Color(0x4d000000),
                width: 0.3,
              ),
            ),
            color: widget.backgroundColor ??
                CupertinoTheme.of(context).barBackgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              _buildNavigatorBar(context),
              if (widget.tabBar != null) widget.tabBar!,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildNavigatorBar(BuildContext context) {
    var leading = widget.leading;
    if (widget.automaticallyImplyLeading) {
      leading ??= const CupertinoNavigationBarBackButton();
    }

    return SizedBox(
      height: kCupertinoNavigatorBar,
      child: Padding(
        padding: widget.padding,
        child: Stack(
          children: [
            if (leading != null)
              Align(
                alignment: Alignment.centerLeft,
                child: leading,
              ),
            if (widget.title != null)
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: FixColor.title.resolveFrom(context),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.actions ?? <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarScrollNotifier extends StatelessWidget {
  const AppBarScrollNotifier({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: child,
      onNotification: (notification) {
        var metrics = notification.metrics;
        assert(metrics.axis == Axis.vertical);
        if (metrics.pixels < 0 || metrics.pixels > metrics.maxScrollExtent) {
          metrics = FixedScrollMetrics(
            pixels: metrics.pixels < 0 ? 0 : metrics.maxScrollExtent,
            axisDirection: metrics.axisDirection,
            maxScrollExtent: metrics.maxScrollExtent,
            minScrollExtent: metrics.minScrollExtent,
            viewportDimension: metrics.viewportDimension,
          );
        }
        AppBarScrollNotification(
          metrics: metrics,
          context: context,
        ).dispatch(context);
        return true;
      },
    );
  }
}

class AppBarScrollNotification extends ScrollNotification {
  AppBarScrollNotification({
    required BuildContext context,
    required ScrollMetrics metrics,
  }) : super(context: context, metrics: metrics);
}

class OffsetCupertinoAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const OffsetCupertinoAppBar({
    Key? key,
    required this.child,
    required this.offset,
  }) : super(key: key);

  final ObstructingPreferredSizeWidget child;
  final Animation<Offset> offset;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offset,
      child: child,
    );
  }

  @override
  Size get preferredSize => child.preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) =>
      child.shouldFullyObstruct(context);
}
