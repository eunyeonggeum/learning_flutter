import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/src/screens/login_screen.dart';
import 'package:flutter_uber_clone/src/screens/main_screen.dart';
import 'package:flutter_uber_clone/src/screens/registeration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber clone App',
      theme: ThemeData(
          fontFamily: 'Brand Bold',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: LoginScreen.idScreen,
      routes: {
        RegisterationScreen.idScreen: (context) => RegisterationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
