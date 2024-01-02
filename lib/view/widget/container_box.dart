import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({
    super.key, required this.icon, required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:const Color(0xFFE2E8F0),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6,left: 8,right: 8,bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon,size: 24,color: Colors.grey[600],),
              Text(text,style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}