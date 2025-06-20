import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../core/widght/Widght.dart';
import '../logic/cubit/trinner_cubit.dart';

Row text_review(double width, double height, TrinnerCubit cubit) {
  return Row(
    children: [
      text(
          title: "Write your Review",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      Spacer(),
      Container(
        // color: Colors.red,
        width: width * 0.3,
        height: height * 0.02,
        alignment: Alignment.center,
        child: SmoothStarRating(
          borderColor: Color.fromRGBO(112, 112, 112, 1),
          color: Color.fromRGBO(228, 179, 67, 1),
          rating: cubit.rating,
          // isReadOnly: false,
          size: 20,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          defaultIconData: Icons.star_border,
          starCount: 5,
          allowHalfRating: true,
          spacing: 2.0,
          onRatingChanged: (v1) {
            cubit.chaingStar(v1);
          },
        ),
      ),
    ],
  );
}
