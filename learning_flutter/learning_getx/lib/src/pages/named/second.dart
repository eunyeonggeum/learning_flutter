import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('뒤로 이동')),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/');
                },
                child: Text('홈 이동')),
          ],
        ),
      ),
    );
  }
}
