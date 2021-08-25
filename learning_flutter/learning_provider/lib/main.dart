import 'package:flutter/material.dart';
import 'package:learning_provider/src/home.dart';
import 'package:learning_provider/src/provider/bottom_navigation_provider.dart';
import 'package:learning_provider/src/provider/count_provider.dart';
import 'package:learning_provider/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Sample',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => CountProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider())
        ],
        child: Home(),
      ),
    );
  }
}
