import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/model/video_player_model.dart';
import '../utils/image_url.dart';

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
              child: Container(
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
                    color: Colors.grey[500]
                ),),
                const SizedBox(width: 30,),
                Text(formatDate(data.dateAndTime ?? ""),style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]
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