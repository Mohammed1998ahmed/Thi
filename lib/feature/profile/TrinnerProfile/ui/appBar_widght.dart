import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/trinner_cubit.dart';

AppBar appBar_widght(BuildContext context, TrinnerCubit cubit) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Color0,
        size: 35,
      ),
    ),
    title: Center(
      child: text(
          title: "Profile",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(35, 0, 44, 1)),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            // border: Border.all(
            //   color: Color0,
            //   width: 2,
            // ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.star,
                  size: 35,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              cubit.avarageReviewRating == null
                  ? Container(child: text(title: "0"))
                  : Container(
                      child: text(
                          title:
                              cubit.avarageReviewRating!.averageRating == null
                                  ? "0"
                                  : cubit.avarageReviewRating!.averageRating
                                      .toString(),
                          color: Color0),
                    ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
