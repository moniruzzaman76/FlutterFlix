import 'package:flutter/material.dart';
import 'package:flutterflix/view/home_screen.dart';
void main() {
  runApp(const VideoPlayerApp());
}

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

