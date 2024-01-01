import 'package:get/get.dart';
import '../data/Utils/urls.dart';
import '../data/model/video_player_model.dart';
import '../data/network_service/network_caller.dart';
import '../data/network_service/network_response.dart';


class VideoPlayListController extends GetxController{

  bool _videoPlayListInProgress = false;
  VideoPlayListModel _videoPlayListModel = VideoPlayListModel();

  bool get videoPlayListInProgress => _videoPlayListInProgress;
  VideoPlayListModel get videoPlayListModel => _videoPlayListModel;

  Future<bool> getVideoPlayList() async {
    _videoPlayListInProgress = true;
    update();

    final NetworkResponse response = await NetWorkCaller().getRequest(Urls.videoListUrl);
    _videoPlayListInProgress = false;
    update();

    if (response.isSuccess) {
      _videoPlayListModel = VideoPlayListModel.fromJson(response.body!);
      update();
      return true;
    } else {
      return false;
    }
  }
}