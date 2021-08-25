import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learning_getx/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Getx',
            style: TextStyle(fontSize: 30),
          ),
          GetBuilder<CountContollerWithGetx>(builder: (controller) {
            return Text('${controller.count}', style: TextStyle(fontSize: 50));
          }),
          ElevatedButton(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Get.find<CountContollerWithGetx>().increase();
              })
        ],
      ),
    );
  }
}
