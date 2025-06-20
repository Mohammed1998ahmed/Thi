import 'package:flutter/material.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import '../Details_Club/cubit/home_stable_cubit.dart';
import 'ui/about_widght_screen1.dart';
import 'ui/address_widght_screen1.dart';
import 'ui/images_screen1.dart';
import 'ui/opening_hours_screen1.dart';

class Screen1 extends StatelessWidget {
  final HomeStableCubit cubit;

  const Screen1({super.key, required this.cubit});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(71, 181, 255, 0.623), // اللون الأصلي
              Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: cubit.clubIDModel == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            about_widght(context, cubit: cubit),
                            opening_hours(context, cubit: cubit),
                            address_widght(context, cubit: cubit),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  text(
                                      title: "Photos",
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  Spacer(),
                                  text(
                                      title: "View all",
                                      color: Color0,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                            ),
                            images(context, cubit: cubit),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
