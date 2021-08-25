import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/src/pages/normal/second.dart';

class FirstNamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offNamed('/second');
                },
                child: Text('다음페이지 이동'))
          ],
        ),
      ),
    );
  }
}
