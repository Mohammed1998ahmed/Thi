import 'package:flutter/material.dart';

import '../../../../../core/component/conset/Const.dart';
import '../../../../../core/widght/Widght.dart';
import '../logic/cubit/cours_booking_cubit.dart';

Padding appBar_class(CoursBookingCubit cubit, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          child: text(
            title: " Meetings :  ",
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          child: text(
            title: cubit.detailsClassModel!.classes![index].class1.toString(),
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        Row(
          children: [
            text(title: "Price  :  ", color: Color4),
            text(
                title:
                    cubit.detailsClassModel!.classes![index].price.toString(),
                color: Color4),
          ],
        ),
      ],
    ),
  );
}
