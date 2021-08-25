import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_youtubeclone/src/models/youtube_video_result.dart';
import 'package:getx_youtubeclone/src/repository/youtube_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {
  String key = 'SearchKey';
  late SharedPreferences profs;
  Set<String> originHistory = {};
  RxList<String> history = RxList<String>.empty(growable: true);
  // = [''].obs; -> ['']안하면 리스트 안에 값이 앞에 명시해주더라도 다이나믹으로 지정됨, 때문에 ''를 넣어서 스트링이 들어가는 걸 명시해주어야함 하지만 이렇게 되면 하나의 '' 값이 들어가게 되어 화면에 표시될 수 있음

  @override
  void onInit() async {
    profs = await SharedPreferences.getInstance();
    List<dynamic> initData =
        profs.get(key) == null ? [] : profs.get(key) as List;
    originHistory.addAll(history(initData.map((_) => _.toString()).toList()));
    history(originHistory.toList());
    super.onInit();
  }

  void submitSearch(String search) {
    history.clear(); // 이걸 추가 안하면 지금 까지 history에 있던게 addall에서 또 추가 됨
    originHistory.add(search);
    history.addAll(originHistory.toList()); // 검색하자마자 하단에 검색기록 갱신
    profs.setStringList(key, originHistory.toList());
  }

  void _searchYoutube(String searchKey) async {
    YoutubeVideoResult? youtubeVideoResult =
        await YoutubeRepository.to.search(searchKey, '');
    print(youtubeVideoResult!.items!.length.toString());
  }
}
