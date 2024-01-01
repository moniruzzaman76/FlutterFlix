import 'package:flutter/material.dart';
import 'package:flutterflix/view/video_player_screen.dart';
import 'package:flutterflix/view/widget/video_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
            itemBuilder: (context,index){
          return  InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const VideoPlayerScreen()));
          },
              child: const VideoListWidget()
          );
        })
      ),
    );
  }
}


