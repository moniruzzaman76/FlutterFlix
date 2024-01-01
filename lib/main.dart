import 'package:flutter/material.dart';
import 'package:flutterflix/State_holders/video_playList_controller.dart';
import 'package:flutterflix/view/screen/home_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const VideoPlayerApp());
}

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
     debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideoPlayListController>(VideoPlayListController());

  }
}

