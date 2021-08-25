import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/src/home.dart';
import 'package:learning_getx/src/pages/named/first.dart';
import 'package:learning_getx/src/pages/named/second.dart';
import 'package:learning_getx/src/pages/next.dart';
import 'package:learning_getx/src/pages/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: '/first',
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/second',
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/next', page: () => NextPage(), transition: Transition.zoom),
        GetPage(
          name: '/user/:uid',
          page: () => UserPage(),
        )
      ],
    );
  }
}
