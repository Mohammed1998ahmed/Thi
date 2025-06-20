import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/sharePreferinces/shardprefericences.dart';
import '../../../../core/widght/Widght.dart';
import '../cubit/home_stable_cubit.dart';

AppBar appBar_widght(BuildContext context, HomeStableCubit cubit,
    {required int Id}) {
  return AppBar(
    backgroundColor: const Color.fromARGB(0, 82, 6, 6),
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
        child: cubit.clubIDModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    text(
                        title: cubit.clubIDModel!.club!.name.toString(),
                        // "Godolphin Stables",
                        color: Color3,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                    text(
                        title: cubit.clubIDModel!.club!.website.toString(),
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
            title: avarageReviewClub != 0
                ? avarageReviewClub.toString()
                : cubit.getAverageRevewModel == null
                    ? "0"
                    : cubit.getAverageRevewModel!.averageRating == null
                        ? "0"
                        : cubit.getAverageRevewModel!.averageRating.toString(),
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            final clubId = cubit.clubIDModel?.club?.id;
            final userId = CachShpreafapp.getdata(key: "UserID");

            if (clubId != null && userId != null) {
              final isFavorite = CachShpreafapp.getdata(
                  key:
                      "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}$clubId");

              if (isFavorite == true) {
                cubit.postRemoveFavoratie(Id, userId);
              } else {
                cubit.postFavoratie(Id, userId);
              }
            }
          },
          icon: CachShpreafapp.getdata(
                          key:
                              "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${cubit.clubIDModel?.club?.id}")
                      as bool? ??
                  false
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 35,
                )
              : Icon(
                  Icons.favorite_border_outlined,
                  color: Color3,
                  size: 35,
                ))
    ],
  );
}
