import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List View'),
        ),
        body: Center(
          child: _buildlist(),
        ),
      ),
    );
  }
}

Widget _buildlist() => ListView(
      children: [_tile('안녕하세요', '반가워요!!')],
    );

ListTile _tile(String title, String subtitle) => ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
