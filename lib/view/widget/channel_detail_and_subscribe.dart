import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/image_url.dart';

class ChannelDetailsAndSubscribe extends StatelessWidget {
  const ChannelDetailsAndSubscribe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}