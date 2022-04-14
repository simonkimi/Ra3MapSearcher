import 'package:flutter/cupertino.dart';

import 'colors.dart';

CupertinoThemeData defaultTheme() => const CupertinoThemeData(
      primaryColor: CupertinoColors.systemBlue,
      primaryContrastingColor: CupertinoColors.white,
      scaffoldBackgroundColor: FixColor.scaffoldBackgroundColor,
      barBackgroundColor: FixColor.navigationBarBackground,
    );
