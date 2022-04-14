import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ra3_map_searcher/data/global_controller.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_binding.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_page.dart';
import 'package:ra3_map_searcher/ui/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(GlobalController(), permanent: true).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: '红警3地图预览器',
      initialRoute: '/',
      theme: defaultTheme(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        RefreshLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      builder: (context, child) {
        return BotToastInit()(context, child);
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      getPages: [
        GetPage(
          name: '/',
          page: () => const SearchPage(),
          binding: SearchPageBinding(),
        ),
      ],
    );
  }
}
