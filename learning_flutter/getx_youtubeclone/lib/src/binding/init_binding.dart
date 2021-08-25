import 'package:get/get.dart';
import 'package:getx_youtubeclone/src/controller/app_controller.dart';
import 'package:getx_youtubeclone/src/repository/youtube_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
