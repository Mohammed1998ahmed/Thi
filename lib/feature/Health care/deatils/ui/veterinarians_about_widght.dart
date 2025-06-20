import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Profile/ProfileDocor.dart';
import '../../ScreensHealth/Screen1.dart';
import '../../ScreensHealth/Screen2.dart';
import '../logic/cubit/details_health_cubit.dart';

Container veterinarians_about_widght(
    BuildContext context, DetailsHealthCubit cubit,
    {required int ID_helthCare}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.80,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.32,
            // color: Color.fromRGBO(90, 60, 98, 0.15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                  Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.007,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                            Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: text(
                            title: "Veterinarians",
                            color: Color3,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1919999,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: cubit.allDoctorsModel == null
                          ? Container()
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.allDoctorsModel!.doctors!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              ProfileDoctor(
                                            ID_Doctor: cubit.allDoctorsModel!
                                                .doctors![index].id!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              // CircleAvatar(
                                              //   radius: 33,
                                              //   backgroundColor: Color0,
                                              // ),
                                              // CircleAvatar(
                                              //   radius: 31,
                                              //   backgroundColor: Colors.white,
                                              // ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.17,

                                                decoration: BoxDecoration(
                                                    color: Color0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                // radius: 28,
                                                clipBehavior: Clip.antiAlias,
                                                // backgroundColor: Colors.transparent,

                                                //////////////////////////////////
                                                child: Image.network(
                                                  ImagesPath +
                                                      cubit.allDoctorsModel!
                                                          .doctors![index].image
                                                          .toString(),
                                                  fit: BoxFit.cover,
                                                  // width: MediaQuery.of(context).size.width,
                                                  // height: MediaQuery.of(context).size.height,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Color0.withOpacity(
                                                          0.7)),
                                                  child: text(
                                                      title: cubit
                                                          .allDoctorsModel!
                                                          .doctors![index]
                                                          .firstName
                                                          .toString(),
                                                      color: Color4,
                                                      fontSize: 12,
                                                      // textAlign: TextAlign.center,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        ////////////////////////////
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                  ]),
            ),
          ),
          /////////////////////
          Container(
            height: MediaQuery.of(context).size.height *
                0.682, // color: Colors.pink,
            child: DefaultTabController(
                length: 2,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.212,
                    // color: Colors.pink,
                    child: Column(children: [
                      Container(
                        color: Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                        child: TabBar(
                          labelColor: Color3,
                          indicatorColor: Color3,
                          unselectedLabelColor: Color.fromRGBO(5, 0, 0, 0.5),
                          tabs: [
                            Tab(text: 'About'),
                            Tab(text: 'Review'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ScreenHealth1(
                              detailsHealthCubit: cubit,
                            ),
                            /////////////////////////// edit
                            ScreenHealth2(
                              health_id: ID_helthCare,
                              cubit: cubit,
                            )
                          ],
                        ),
                      ),
                    ]))),
          ),
        ],
      ),
    ),
  );
}
