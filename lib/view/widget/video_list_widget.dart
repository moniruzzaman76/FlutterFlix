import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({
    super.key,
  });

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage("assets/images/thumbnail.jpg")
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
                child: Text("3:40",style: GoogleFonts.inter(
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
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/thumbnail.jpg"),
                radius: 22,
              ),
            ),
            title:Text(
              "আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান",
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
                Text("53,332 views",style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400]
                ),),
                const SizedBox(width: 30,),
                Text("Feb 21,2021",style: GoogleFonts.inter(
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
}