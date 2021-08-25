import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_youtubeclone/src/components/custom_appbar.dart';
import 'package:getx_youtubeclone/src/components/video_widget.dart';
import 'package:getx_youtubeclone/src/controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: CustomAppBar(),
                  floating: true,
                  snap: true,
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        //page route
                        Get.toNamed('/detail/239587');
                      },
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items![index]),
                    );
                  },
                  childCount: controller.youtubeResult.value.items == null
                      ? 0
                      : controller.youtubeResult.value.items!.length,
                ))
              ],
            )));
  }
}
