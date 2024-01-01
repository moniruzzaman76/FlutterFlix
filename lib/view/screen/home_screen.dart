import 'package:flutter/material.dart';
import 'package:flutterflix/State_holders/video_playList_controller.dart';
import 'package:flutterflix/view/screen/video_player_screen.dart';
import 'package:get/get.dart';

import '../widget/video_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.find<VideoPlayListController>().getVideoPlayList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VideoPlayListController>(
        builder: (videoPlayListController) {
          return Visibility(
            visible: !videoPlayListController.videoPlayListInProgress,
            replacement: const Center(child: CircularProgressIndicator(),),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: videoPlayListController.videoPlayListModel.results?.length ?? 0,
                itemBuilder: (context,index){
              return  InkWell(
              onTap: (){
                Get.to(()=>const VideoPlayerScreen());
              },
                  child:  VideoListWidget(data: videoPlayListController.videoPlayListModel.results![index],),

              );
            }),
          );
        }
      ),
    );
  }
}


