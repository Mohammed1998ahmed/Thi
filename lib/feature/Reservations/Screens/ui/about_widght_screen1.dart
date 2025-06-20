import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/cubit/home_stable_cubit.dart';

Column about_widght(BuildContext context, {required HomeStableCubit cubit}) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(40, 168, 253, 1),
              Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
              Color.fromRGBO(134, 255, 255, 1), // اللون المتناسق
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: text(
              title: "About",
              color: Color3,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
        child: text(
            title: cubit.clubIDModel!.club!.description!,
            color: Colors.white60,
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
    ],
  );
}
