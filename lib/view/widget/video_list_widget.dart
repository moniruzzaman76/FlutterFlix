import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/model/video_player_model.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({
    super.key, required this.data,
  });

  final Results data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16,),
          Text("Trending Videos",style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A202C),
          ),),
          const SizedBox(height: 16,),
          Container(
            alignment: Alignment.bottomRight,
            height:192,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage(data.thumbnail ?? "")
                )
            ),
            child: Container(
                margin: const EdgeInsets.all(16),
                alignment: Alignment.center,
                height: 17,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
                child: Text(data.duration ?? "0:00",style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),)
            ),
          ),
          const SizedBox(height: 16,),
          ListTile(
            leading: InkWell(
              onTap: (){},
              child: CircleAvatar(
                backgroundImage: NetworkImage(data.channelImage ?? "assets/images/thumbnail.jpg"),
                radius: 22,
              ),
            ),
            title:Text(
             data.title ?? "Unknown Name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.hindSiliguri(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey[90],
              ),
            ) ,
            trailing: IconButton(onPressed: (){},icon: Icon(Icons.more_vert,color: Colors.grey[400],),),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.viewers} Views",style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400]
                ),),
                const SizedBox(width: 30,),
                Text(formatDate(data.dateAndTime ?? ""),style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400]
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
  String formatDate(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final formattedDate = DateFormat.MMMd().add_y().format(dateTime);
    return formattedDate;
  }

}