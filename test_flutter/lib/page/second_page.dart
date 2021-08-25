import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:test_flutter/controller/main_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GetBuilder<MainController>(builder: (_) {
            //   return Text(
            //     MainController.to.test.toString(),
            //     style: TextStyle(fontSize: 40),
            //   );
            // }),
            // ElevatedButton(
            //     onPressed: () {
            //       MainController.to.increase();
            //     },
            //     child: Text('+')),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/');
                },
                child: Text('Main으로 돌아가기'))
          ],
        ),
      ),
    );
  }
}
