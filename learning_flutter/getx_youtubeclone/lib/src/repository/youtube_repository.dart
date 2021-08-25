import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:getx_youtubeclone/src/models/statistics.dart';
import 'package:getx_youtubeclone/src/models/youtube_video_result.dart';
import 'package:getx_youtubeclone/src/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos() async {
    String url =
        '/youtube/v3/search?part=snippet&channelId=UCa6oI4aIHJeivaSiVTOseJw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAbXe2ojrzj_r9e9gS7JOk4s5rn0XPlTfQ';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        '/youtube/v3/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAbXe2ojrzj_r9e9gS7JOk4s5rn0XPlTfQ&pageToken=$nextPageToken&q=$searchKeyword';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics?> getVideoInfoById(String vdieoId) async {
    String url =
        '/youtube/v3/videos?part=snippet,statistics&key=AIzaSyAbXe2ojrzj_r9e9gS7JOk4s5rn0XPlTfQ&id=$vdieoId';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        Map<String, dynamic> data = response.body['items'][0];
        return Statistics.fromJson(data['statistics']);
      }
    }
  }

  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        '/youtube/v3/channels?part=statistics, snippet&key=AIzaSyAbXe2ojrzj_r9e9gS7JOk4s5rn0XPlTfQ&id=$channelId';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        Map<String, dynamic> data = response.body['items'][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
