import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_youtubeclone/src/controller/video_controller.dart';
import 'package:getx_youtubeclone/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  const VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoController _videoController;

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            imageUrl: widget.video.snippet.thumbnails.medium.url,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ), //Container에 height을 설정해줘버리면 기기의 해상도에 따라 문제가 될 수 있음(overflow), 때문에 해당 문제를 해결하고 3개씩 load하는 방법을 위해 cachednetworkimage 사용
            fit: BoxFit.fitWidth,
          ),
          // child: Image.network(
          //   widget.video.snippet.thumbnails.medium.url,
          //   fit: BoxFit.fitWidth,
          // ), // Container에 height을 추가하면 3개의 image만 먼저 load됨/ height을 빼게 되면 10개의 Image 모두 load
        ),
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 5),
      child: Row(
        children: [
          Obx(() => CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.withOpacity(0.5),
                backgroundImage:
                    Image.network(_videoController.youtuberThumnailUrl).image,
              )),
          SizedBox(width: 15),
          Expanded(
              child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Text(widget.video.snippet.title, maxLines: 2),
                ),
                IconButton(
                    alignment: Alignment.topCenter,
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, size: 18)),
              ]),
              Row(
                children: [
                  Text(
                    widget.video.snippet.channelTitle,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.8)),
                  ),
                  Text(' · '),
                  Obx(() => Text(
                        _videoController.viewCountString,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      )),
                  Text(' · '),
                  Text(
                    DateFormat('yyyy-MM-dd')
                        .format(widget.video.snippet.publishedAt),
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.6)),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }
}
