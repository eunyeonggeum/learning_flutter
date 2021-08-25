import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controller/main_controller.dart';
import 'package:test_flutter/page/first_page.dart';
import 'package:test_flutter/page/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(
            name: '/first',
            page: () => FirstPage(),
            binding: BindingsBuilder(
                () => Get.put<MainController>(MainController())))
      ],
    );
  }
}
