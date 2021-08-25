import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_youtubeclone/src/app.dart';
import 'package:getx_youtubeclone/src/binding/init_binding.dart';
import 'package:getx_youtubeclone/src/components/youtube_detail.dart';
import 'package:getx_youtubeclone/src/controller/youtube_search_controller.dart';
import 'package:getx_youtubeclone/src/pages/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube Clone App",
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => App()),
        GetPage(name: '/detail/:videoId', page: () => YoutubeDetail()),
        GetPage(
            name: '/search',
            page: () => YoutubeSearch(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeSearchController>(
                () => YoutubeSearchController())))
      ],
    );
  }
}
