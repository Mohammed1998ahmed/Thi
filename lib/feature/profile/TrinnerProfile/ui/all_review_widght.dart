import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/trinner_cubit.dart';

Row all_review_widght(TrinnerCubit cubit) {
  return Row(
    children: [
      text(
          title: "All Reviews",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0),
      Spacer(),
      cubit.getAllReviewUserByTrinner != null
          ? text(
              title: cubit.getAllReviewUserByTrinner!.reviews == null
                  ? "(0)"
                  : "(" +
                      cubit.getAllReviewUserByTrinner!.reviews!.length
                          .toString() +
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
