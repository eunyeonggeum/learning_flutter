import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/src/pages/normal/first.dart';
import 'package:learning_getx/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('라우트 관리 홈')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (_) => FirstPage())); //기존의 방식
                  Get.to(FirstPage());
                },
                child: Text('일반적인 라우트')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/first');
                },
                child: Text('Named 라우트')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/next', arguments: '개남');
                },
                child: Text('Arguments 전달')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/user/28357');
                },
                child: Text('동적 url')),
            ElevatedButton(
                onPressed: () {
                  Get.to(SimpleStateManagePage());
                },
                child: Text('단순상태관리'))
          ],
        ),
      ),
    );
  }
}
