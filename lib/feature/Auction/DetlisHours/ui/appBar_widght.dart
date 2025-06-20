import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/sharePreferinces/shardprefericences.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/detlis_hours_cubit.dart';

AppBar appBar_widght(
    BuildContext context, double height, DetlisHoursCubit cubit,
    {required int IDActions}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Color0,
      ),
    ),
    centerTitle: true,
    toolbarHeight: height * 0.05,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: text(
        title: 'Information',
        color: Color0,
        fontSize: 22,
        fontWeight: FontWeight.w800),
    actions: [
      IconButton(
        icon: CachShpreafapp.getdata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${IDActions}")
            ? Icon(
                Icons.star,
                color: Color0,
                size: 30,
              )
            : Icon(
                Icons.star_border,
                size: 30,
              ),
        onPressed: () {
          // cubit.getFavorite();
          CachShpreafapp.getdata(
                  key:
                      "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${IDActions}")
              ? cubit.postRemoveFavoratie(
                  idActions: IDActions,
                  idUser: CachShpreafapp.getdata(key: "UserID"),
                  context: context)
              : cubit.postFavoratie(
                  idActions: IDActions,
                  idUser: CachShpreafapp.getdata(key: "UserID"));
        },
      ),
    ],
  );
}
