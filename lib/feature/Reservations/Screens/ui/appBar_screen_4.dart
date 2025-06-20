import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../core/widght/Widght.dart';
import '../../Details_Club/cubit/home_stable_cubit.dart';

Row appBar_screen_4(double width, double height, HomeStableCubit cubit) {
  return Row(
    children: [
      text(
          title: "Write your Review",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black),
      Spacer(),
      Container(
        width: width * 0.3,
        height: height * 0.02,
        alignment: Alignment.center,
        child: SmoothStarRating(
          borderColor: Color.fromRGBO(112, 112, 112, 1),
          color: Color.fromRGBO(228, 179, 67, 1),
          rating: cubit.rating,
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
