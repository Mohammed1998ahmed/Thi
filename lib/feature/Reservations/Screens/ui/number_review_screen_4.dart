import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/cubit/home_stable_cubit.dart';

Row number_review_screen_4(HomeStableCubit cubit) {
  return Row(
    children: [
      text(
          title: "All Reviews",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0),
      Spacer(),
      cubit.getRevewListModel != null
          ? text(
              title: cubit.getRevewListModel!.reviews == null
                  ? "(0)"
                  : "(" +
                      cubit.getRevewListModel!.reviews!.length.toString() +
                      ")",
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color4)
          : text(
              title: "(" + "0" + ")",
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color4),
    ],
  );
}
