import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  int test = 0;

  void increase() {
    test++;
    update();
  }

  void minus() {
    test--;
    update();
  }
}
