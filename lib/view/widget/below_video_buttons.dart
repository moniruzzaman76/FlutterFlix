import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'container_box.dart';

class BelowVideoButtons extends StatelessWidget {
  const BelowVideoButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}