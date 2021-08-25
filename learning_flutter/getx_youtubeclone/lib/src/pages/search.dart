import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_youtubeclone/src/controller/youtube_search_controller.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  const YoutubeSearch({Key? key}) : super(key: key);

  Widget _searchHistory() {
    return Obx(() => ListView(
          children: List.generate(
            controller.history.length,
            (index) => ListTile(
              leading: SvgPicture.asset(
                'assets/svg/icons/wall-clock.svg',
                width: 20,
              ),
              title: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                  child: Text(controller.history[index])),
              trailing: Icon(Icons.arrow_forward_ios, size: 15),
            ),
          ).toList(),
        ));
  }

  Widget _searchResultView() {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.find<YoutubeSearchController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/icons/back.svg'),
          onPressed: Get.back,
        ),
        title: TextField(
          decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5))),
          onSubmitted: (value) {
            controller.submitSearch(value);
          },
        ),
      ),
      body: _searchHistory(),
    );
  }
}
