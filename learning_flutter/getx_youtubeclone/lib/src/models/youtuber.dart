import 'package:getx_youtubeclone/src/models/statistics.dart';
import 'package:getx_youtubeclone/src/models/video.dart';

class Youtuber {
  Youtuber({this.snippet, this.statistics});

  Snippet? snippet;
  Statistics? statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
      snippet: Snippet.fromJson(json['snippet']),
      statistics: Statistics.fromJson(json['statistics']));
}
