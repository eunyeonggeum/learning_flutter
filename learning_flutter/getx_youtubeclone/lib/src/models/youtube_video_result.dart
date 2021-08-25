import 'package:getx_youtubeclone/src/models/video.dart';

class YoutubeVideoResult {
  int? totalResult;
  int? reultPerPage;
  String? nextPagetoken;
  List<Video>? items;

  YoutubeVideoResult(
      {this.totalResult, this.reultPerPage, this.nextPagetoken, this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResult: json['pageInfo']['totalResults'],
          reultPerPage: json['pageInfo']['resultsPerPage'],
          nextPagetoken: json['nextPageToken'] ?? "",
          items: List<Video>.from(
              json['items'].map((data) => Video.fromJson(data))));
}
