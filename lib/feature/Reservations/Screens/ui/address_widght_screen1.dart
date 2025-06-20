import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/cubit/home_stable_cubit.dart';

Container address_widght(BuildContext context,
    {required HomeStableCubit cubit}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.13,
    // color: Colors.grey,
    child: Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      title: "Address",
                      color: Color3,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_city_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    child: text(
                        title: cubit.clubIDModel!.club!.address!,
                        // "57G5+46R - Dubai",
                        color: Color.fromRGBO(0, 0, 0, 0.54),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .080),
      ],
    ),
  );
}
