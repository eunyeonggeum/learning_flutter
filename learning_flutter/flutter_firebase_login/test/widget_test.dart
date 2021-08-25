// ignore: unused_import
import 'dart:io'; // 소켓, http 파일과 통신할 때 필요한 패키지
// ignore: unused_import
import 'package:flutter/material.dart';

void main() => ShowData();

// ignore: non_constant_identifier_names
void ShowData() async {
  startTask();
  String account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작';
  print(info1);
}

Future<String> accessData() async {
  late String account;

  Duration time = Duration(seconds: 3);
  //sleep(time); // 3초 후에 해당 코드 실행 -> synchronous하게 실행(실행에 시간이 걸리던 걸리지 않던간에 시간이 되면 무조건 실행됨)

  if (time.inSeconds > 2) {
    await Future.delayed(time, () {
      account = '8,500만원';
      print(account);
    });
  } else {
    String info2 = '데이터를 가져왔습니다';
    print(info2);
  }

  return account;
}

void fetchData(String account) {
  String info3 = '잔액은 $account 입니다';
  print(info3);
}
