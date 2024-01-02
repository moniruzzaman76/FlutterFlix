// import 'package:get/get.dart';
// import '../data/Utils/urls.dart';
// import '../data/model/video_player_model.dart';
// import '../data/network_service/network_caller.dart';
// import '../data/network_service/network_response.dart';
// class VideoPlayListController extends GetxController{
//
//   bool _videoPlayListInProgress = false;
//   VideoPlayListModel _videoPlayListModel = VideoPlayListModel();
//
//   bool get videoPlayListInProgress => _videoPlayListInProgress;
//   VideoPlayListModel get videoPlayListModel => _videoPlayListModel;
//
//   Future<bool> getVideoPlayList() async {
//     _videoPlayListInProgress = true;
//     update();
//
//     final NetworkResponse response = await NetWorkCaller().getRequest(Urls.videoListUrl);
//     _videoPlayListInProgress = false;
//     update();
//
//     if (response.isSuccess) {
//       _videoPlayListModel = VideoPlayListModel.fromJson(response.body!);
//       update();
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/Utils/urls.dart';
import '../data/model/video_player_model.dart';
import '../data/network_service/network_caller.dart';
import '../data/network_service/network_response.dart';

class VideoPlayListController extends GetxController {
  bool _videoPlayListInProgress = false;
  VideoPlayListModel _videoPlayListModel = VideoPlayListModel();
  int _currentPage = 1;
  int get currentPage => _currentPage;

  bool get videoPlayListInProgress => _videoPlayListInProgress;
  VideoPlayListModel get videoPlayListModel => _videoPlayListModel;

  Future<bool> getVideoPlayList() async {
    _videoPlayListInProgress = true;
    update();

    final NetworkResponse response = await NetWorkCaller().getRequest(Urls.videoListUrl.replaceAll('page=1', 'page=$_currentPage'));
    _videoPlayListInProgress = false;
    update();

    if (response.isSuccess) {
      if (_currentPage == 1) {
        // If it's the first page, replace the existing data
        _videoPlayListModel = VideoPlayListModel.fromJson(response.body!);
      } else {
        // If it's not the first page, append the new data
        _videoPlayListModel.results?.addAll(
          VideoPlayListModel.fromJson(response.body!).results ?? [],
        );
      }
      update();
      return true;
    } else {
      return false;
    }
  }

  void loadMore() {
    _currentPage++;
    getVideoPlayList();
  }
}
