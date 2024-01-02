import 'package:flutter/material.dart';
import 'package:flutterflix/view/utils/image_url.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentTileModelSheet extends StatelessWidget {
  const CommentTileModelSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Container(
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
      title: Column(
        children: [
          Row(
            children: [
              Text("Moniruzzaman",style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color:Colors.grey[600],
              ),),
              const SizedBox(width: 10,),
              Text("2 hours ago",style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 8,
                color:Colors.grey[400],
              ),),
            ],
          ),
          const SizedBox(height: 4,),
          Text("হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.hindSiliguri(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color:Colors.grey[700],
          ),),
        ],
      ),
    );
  }
}