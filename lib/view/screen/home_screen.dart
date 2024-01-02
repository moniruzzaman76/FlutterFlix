import 'package:flutter/material.dart';
import 'package:flutterflix/State_holders/video_playList_controller.dart';
import 'package:flutterflix/view/screen/video_player_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/video_list_widget.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//     Get.find<VideoPlayListController>().getVideoPlayList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Text("Trending Videos",style: GoogleFonts.inter(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           color: const Color(0xFF1A202C),
//         ),),
//       ),
//       body: GetBuilder<VideoPlayListController>(
//         builder: (videoPlayListController) {
//           return Visibility(
//             visible: !videoPlayListController.videoPlayListInProgress,
//             replacement: const Center(child: CircularProgressIndicator(),),
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: videoPlayListController.videoPlayListModel.results?.length ?? 0,
//                 itemBuilder: (context,index){
//               return  InkWell(
//               onTap: (){
//                 Get.to(()=> VideoPlayerScreen(
//                   videoData: videoPlayListController.videoPlayListModel.results![index],
//                 ));
//               },
//                   child:  VideoListWidget(data: videoPlayListController.videoPlayListModel.results![index],),
//
//               );
//             }),
//           );
//         }
//       ),
//     );
//   }
// }
//
//

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<VideoPlayListController>().getVideoPlayList();
    });
    // Listen to the scroll events
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Check if the user has reached the end of the list
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      Get.find<VideoPlayListController>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending Videos",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A202C),
          ),
        ),
      ),
      body: GetBuilder<VideoPlayListController>(
        builder: (videoPlayListController) {

          final results = videoPlayListController.videoPlayListModel.results ?? [];
          final visibleResults = results.take(videoPlayListController.currentPage * 5).toList();

          return Visibility(
            visible: !videoPlayListController.videoPlayListInProgress,
            replacement: const Center(child: CircularProgressIndicator()),
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount:visibleResults.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => VideoPlayerScreen(
                      videoData: visibleResults[index],
                    ));
                  },
                  child: VideoListWidget(
                    data: visibleResults[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

