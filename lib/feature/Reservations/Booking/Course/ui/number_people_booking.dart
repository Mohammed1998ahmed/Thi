import 'package:flutter/material.dart';

import '../../../../../core/component/conset/Const.dart';
import '../../../../../core/widght/Widght.dart';
import '../logic/cubit/cours_booking_cubit.dart';

Container number_people_booking(
    BuildContext context, CoursBookingCubit cubit, int index) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.1,
    decoration:
        BoxDecoration(color: Color0, borderRadius: BorderRadius.circular(15.0)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: text(
                title:
                    cubit.detailsClassModel!.classes![index].counter.toString(),
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              child: text(
                title: '\u2192',
                textAlign: TextAlign.center,
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              child: text(
                title: cubit.detailsClassModel!.classes![index].capacity
                    .toString(),
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
