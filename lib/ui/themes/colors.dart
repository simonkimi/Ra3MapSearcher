import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FixColor {
  FixColor._();

  static const CupertinoDynamicColor text =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Color(0xFFF0F0F0),
  );

  static const CupertinoDynamicColor title =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Color(0xdeffffff),
  );

  static CupertinoDynamicColor badge =
      const CupertinoDynamicColor.withBrightness(
    color: Color(0xfff2f1f6),
    darkColor: Color(0xff1c1c1e),
  );

  static const CupertinoDynamicColor navigationBarBackground =
      CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(200, 255, 255, 255),
    darkColor: Color.fromARGB(180, 30, 30, 30),
  );

  static const CupertinoDynamicColor groupedColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xffeeeeee),
    darkColor: Color(0xff171717),
  );

  static const CupertinoDynamicColor scaffoldBackgroundColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xfff9f9f9),
    darkColor: Color(0xff0d0d0d),
  );

  static const CupertinoDynamicColor pressedColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xffd1d0d5),
    darkColor: Color(0xff3a3a3a),
  );
}

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;
}

Color? typeColor(String value) {
  final types = [
    '塔防',
    '对战',
    '娱乐',
    '执政官',
    '战役',
    '进攻',
    'mod地图',
    '无限钱',
    '闯关',
    '流线',
    'REMIX',
    '日冕',
    '防守',
    '海战',
    '虐电',
    '挑战'
  ];

  final index = types.indexOf(value);
  if (index == -1) return null;
  return Colors.primaries[index % Colors.primaries.length];
}
