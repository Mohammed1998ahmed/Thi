import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Booking/servic.dart';
import '../../Details_Club/Home.dart';
import '../logic/cubit/location_cubit.dart';

void showBottomSheett(BuildContext context,
    {required LocationCubit cubitLocation,
    required Completer<GoogleMapController> controller1}) {
  showModalBottomSheet(
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(136, 207, 255, 0.548), // اللون الأصلي

                  Color.fromRGBO(71, 181, 255, 0.925), // اللون الأصلي

                  Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          // clipBehavior: Clip.hardEdge,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              text(
                  title: "Stable Nearby",
                  color: Color3,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              text(
                  title: "Found place near Abu Dhabi",
                  color: Color2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
              cubitLocation.listClubsmodel == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.4069,
                      width: MediaQuery.of(context).size.width * 1.59999,
                      child: ListView.separated(
                        itemCount: cubitLocation.listClubsmodel!.data!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.black,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (() {
                                        /////////////////////////// edit edit
                                        Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                Home(
                                              Id: cubitLocation.listClubsmodel!
                                                  .data![index].id!,
                                            ),
                                          ),
                                        );
                                      }),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.250,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          image: DecorationImage(
                                              image: NetworkImage(ImagesPath +
                                                  cubitLocation.listClubsmodel!
                                                      .data![index].profile
                                                      .toString()),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.60,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              print("object");
                                              cubitLocation.ChaningLatLng(
                                                  double.parse(cubitLocation
                                                      .listClubsmodel!
                                                      .data![index]
                                                      .lat!),
                                                  double.parse(cubitLocation
                                                      .listClubsmodel!
                                                      .data![index]
                                                      .long!));

                                              final GoogleMapController
                                                  controller =
                                                  await controller1.future;
                                              controller.animateCamera(
                                                  CameraUpdate
                                                      .newCameraPosition(
                                                CameraPosition(
                                                  target: LatLng(
                                                      double.parse(cubitLocation
                                                          .listClubsmodel!
                                                          .data![index]
                                                          .lat!),
                                                      double.parse(cubitLocation
                                                          .listClubsmodel!
                                                          .data![index]
                                                          .long!)),
                                                  zoom: 15.0,
                                                ),
                                              ));

                                              Navigator.pop(context);
                                              // latitude:
                                              //   // 24.4539,
                                              //   longitude: double.parse(cubit
                                              //       .clubIDModel!.club!.long!),
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.40,
                                                      child: text(
                                                        title: cubitLocation
                                                            .listClubsmodel!
                                                            .data![index]
                                                            .name
                                                            .toString(),
                                                        fontSize: 16,
                                                        color: Color3,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                      child: text(
                                                        title: cubitLocation
                                                            .listClubsmodel!
                                                            .data![index]
                                                            .description
                                                            .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.4),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Spacer(),
                                              InkWell(
                                                onTap: (() {
                                                  Navigator.push<void>(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Service(
                                                        Idcubit: cubitLocation
                                                            .listClubsmodel!
                                                            .data![index]
                                                            .id,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.20,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      // vertical: 5,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Color0,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(5, 5))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: text(
                                                    title: "Book",
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ))
            ],
          ),
        ),
      );
    },
  );
}
