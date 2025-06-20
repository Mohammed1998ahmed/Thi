import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../Reservations/Details_Club/data/TrinerIdByClub.dart';

Center image_trinner(BuildContext context,
    {required MyClubTrenerIDModel cubit, required int indexProfile}) {
  return Center(
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                // radius: 56,
                // backgroundColor: Colors.transparent,
                child: Image.network(
                  ImagesPath + cubit.trainers![indexProfile].image.toString(),
                  fit: BoxFit.cover,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 13,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: 12,
          backgroundColor: Color0,
        ),
      ],
    ),
  );
}
