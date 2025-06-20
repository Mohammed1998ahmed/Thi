import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';
import '../logic/cubit/detlis_hours_cubit.dart';
import 'videoPages.dart';

Padding watch_video_widght(DetlisHoursCubit cubit, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          child: text(title: "To watch a video:"),
        ),
        Spacer(),
        ElevatedButton(
            onPressed: () {
              print(cubit.detailsActionsID!.auction!.horses!.video.toString() +
                  "LLLLLLLLLLLLLLLLLLLLLLL");
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => VideoApp(
                    Urlvideo: cubit.detailsActionsID!.auction!.horses!.video
                        .toString(),
                  ),
                ),
              );
            },
            child: text(title: "Video"))
      ],
    ),
  );
}
