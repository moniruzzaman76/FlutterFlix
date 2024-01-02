import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/data/model/video_player_model.dart';
import 'package:flutterflix/view/utils/icon_url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../utils/image_url.dart';
import '../widget/user_comment_tile.dart';
import '../widget/container_box.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key, required this.videoData, }) : super(key: key);

  final Results videoData;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
     widget.videoData.manifest.toString(),
    ));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GestureDetector(
                        onTap: _togglePlaying,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue,),
                      );
                    }
                  },
                ),
                const Positioned(
                  top: 5,
                  left: 5,
                  child: BackButton(color: Colors.white,),
                ),
                // Positioned(
                //  bottom: 0,
                //   right: 5,
                //   child: IconButton(
                //     onPressed: _togglePlaying,
                //     iconSize: 64,
                //     icon: Icon(
                //       _isPlaying ? Icons.pause : Icons.play_arrow,
                //       color: Colors.grey,size: 20,
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.videoData.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.hindSiliguri(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[90],
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.videoData.viewers ?? 0} Views",style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]
                      ),),
                      const SizedBox(width: 30,),
                      Text("3 day ago",style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]
                      ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16,),
                    const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 5,
                        child: ContainerBox(
                          icon: Icons.favorite_border,
                          text: "Mash Allah (12k)",
                        ),
                      ),
                      SizedBox(width: 4,),
                      Expanded(
                        flex: 3,
                        child:  ContainerBox(
                          icon: CupertinoIcons.hand_thumbsup,
                          text: "Like (12k)",
                        ),
                      ),
                      SizedBox(width: 4,),
                      Expanded(
                        flex: 3,
                        child: ContainerBox(
                          icon: Icons.share,
                          text: "Share",
                        ),
                      ),
                      SizedBox(width: 4,),
                      Expanded(
                        flex: 3,
                        child: ContainerBox(
                          icon: Icons.flag_outlined,
                          text: "Report",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(ImagePath.channelImage,)
                          )
                      ),
                    ),
                    title:  Text("Mega Bangla Tv",style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900]
                    ),),
                    subtitle:Text("3M Subscribers",style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600]
                    ),),
                    trailing: Container(
                      height: 34,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            alignment: Alignment.centerLeft
                        ),
                        onPressed: (){},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.add,color: Colors.white,size: 15,),
                            const Spacer(),
                            Text("Subscribe",style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1 ,color: Colors.grey[300],),
                  Row(
                    children: [
                      Text("Comments 7.5k",style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]
                      ),
                      ),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: Image.asset(IconPath.arrow))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Add Comments",
                        suffixIcon: IconButton(
                            onPressed: (){

                            }, icon: Image.asset(IconPath.submitButton)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.withOpacity(.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.withOpacity(.3)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7,),
                  const UserCommentTile(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


