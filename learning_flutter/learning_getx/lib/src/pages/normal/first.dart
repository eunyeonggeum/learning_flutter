import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/src/pages/normal/second.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (_) => FirstPage())); //기존의 방식
                  Get.to(SecondPage());
                },
                child: Text('다음페이지 이동'))
          ],
        ),
      ),
    );
  }
}
