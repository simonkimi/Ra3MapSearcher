import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_binding.dart';
import 'package:ra3_map_searcher/ui/pages/search_page/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: '红警3地图预览器',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SearchPage(),
          binding: SearchPageBinding(),
        ),
      ],
    );
  }
}
