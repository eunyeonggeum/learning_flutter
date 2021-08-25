import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GeumFlix',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics:
                  NeverScrollableScrollPhysics(), //옆으로 넘기면 옆 섹션으로 넘어가는 것을 막음
              children: [
                HomeScreen(),
                Container(),
                Container(),
                Container(),
              ],
            ),
            bottomNavigationBar: Bottom(),
          ),
        ));
  }
}
