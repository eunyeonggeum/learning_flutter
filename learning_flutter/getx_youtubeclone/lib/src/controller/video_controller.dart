import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_youtubeclone/src/models/statistics.dart';
import 'package:getx_youtubeclone/src/models/video.dart';
import 'package:getx_youtubeclone/src/models/youtuber.dart';
import 'package:getx_youtubeclone/src/repository/youtube_repository.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({required this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    Youtuber? loadYoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => '조회수 ${statistics.value.viewCount ?? '-'}회';

  String get youtuberThumnailUrl {
    if (youtuber.value.snippet == null)
      return "https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png";
    return youtuber.value.snippet!.thumbnails.medium.url;
  }
}
