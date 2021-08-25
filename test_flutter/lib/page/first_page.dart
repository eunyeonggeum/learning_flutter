import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controller/main_controller.dart';
import 'package:test_flutter/page/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MainController>(builder: (_) {
              return Text(
                MainController.to.test.toString(),
                style: TextStyle(fontSize: 40),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  MainController.to.increase();
                },
                child: Text('+')),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => SecondPage());
                },
                child: Text('Next Page'))
          ],
        ),
      ),
    );
  }
}
