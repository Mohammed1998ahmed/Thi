import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/cubit/home_stable_cubit.dart';

Column opening_hours(BuildContext context, {required HomeStableCubit cubit}) {
  return Column(
    children: [
      Row(
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
                  title: "Opening Hours",
                  color: Color3,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Row(
        children: [
          CircleAvatar(
            radius: 4,
            backgroundColor: Color0,
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            height: MediaQuery.of(context).size.height * 0.03,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.clubIDModel!.club!.day!.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  // إذا كان العنصر الأول في القائمة، قم بإرجاع عنصر واحد فقط دون السهم
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: text(
                      title: cubit.clubIDModel!.club!.day![index].toString(),
                      color: Colors.white60,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                } else {
                  // إذا كان العنصر ليس الأول في القائمة، قم بإرجاع عنصر مع السهم
                  return Row(
                    children: [
                      Icon(Icons.arrow_forward, size: 16),
                      SizedBox(width: 8),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: text(
                          title:
                              cubit.clubIDModel!.club!.day![index].toString(),
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: text(
                title: cubit.clubIDModel!.club!.start.toString() +
                    " " +
                    cubit.clubIDModel!.club!.end.toString(),
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ],
  );
}
