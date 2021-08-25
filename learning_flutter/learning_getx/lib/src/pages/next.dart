import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/src/home.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Get.arguments}'),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('뒤로 이동')),
          ],
        ),
      ),
    );
  }
}
