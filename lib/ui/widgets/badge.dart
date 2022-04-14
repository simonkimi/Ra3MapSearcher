import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ra3_map_searcher/ui/themes/colors.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.text,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    this.borderRadius = 8,
    this.fontSize = 15,
    this.textColor,
    this.disable = false,
  }) : super(key: key);

  final Color? color;
  final Color? textColor;
  final String text;
  final EdgeInsets padding;
  final double borderRadius;
  final double fontSize;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    final background = disable
        ? CupertinoColors.systemGrey4.resolveFrom(context)
        : color ?? FixColor.badge.resolveFrom(context);

    return AnimatedContainer(
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      duration: const Duration(milliseconds: 100),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor ??
              (background.isDark
                  ? Colors.white.withOpacity(0.9)
                  : FixColor.text.color),
        ),
      ),
    );
  }
}
