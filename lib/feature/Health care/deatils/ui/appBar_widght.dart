import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/details_health_cubit.dart';

AppBar appBar_widght(BuildContext context, DetailsHealthCubit cubit) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * .12,
        width: MediaQuery.of(context).size.width,
        // color: Colors.yellow,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black.withOpacity(0.3)),
        clipBehavior: Clip.hardEdge,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cubit.healthCaresByIDModel!.healthCare == null
                  ? Container()
                  : Container(
                      child: text(
                          title: cubit.healthCaresByIDModel!.healthCare!.name
                              .toString(),
                          // "Godolphin Stables",
                          color: Color3,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
              cubit.healthCaresByIDModel!.healthCare == null
                  ? Container()
                  : text(
                      title: cubit.healthCaresByIDModel!.healthCare!.website
                          .toString(),
                      // "Horse riding in Abu Dhabi",
                      color: Color3,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
            ]),
      ),
    ),
    actions: [
      TextButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.star_rate,
            color: Colors.amber,
          ),
          label: text(
            title: cubit.getAverageRevewModel == null
                ? "0"
                : cubit.getAverageRevewModel!.averageRating == null
                    ? "0"
                    : cubit.getAverageRevewModel!.averageRating.toString(),
            color: Colors.white,
          )),
    ],
  );
}
