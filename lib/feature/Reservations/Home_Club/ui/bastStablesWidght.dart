import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/Home.dart';
import '../logic/cubit/home1_cubit.dart';

class BestStablesWidght extends StatelessWidget {
  const BestStablesWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
  });

  final double height;
  final double width;
  final Home1Cubit cubit;

  @override
  Widget build(BuildContext context) {
    return cubit.listClubsmodel == null
        ? SpinkitWave()
        : Container(
            height: height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                reviewRaiting.addAll({i + 1: false});

                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(
                          Id: int.parse(
                              cubit.listClubsmodel!.data![i].id.toString()),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.55,
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      // color: Color.fromRGBO(71, 181, 255, 0.685),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(40, 168, 253, 1),
                          Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                          Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print(cubit.listClubsmodel!.data![i].id
                                            .toString() +
                                        "KKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Home(
                                            Id: cubit
                                                .listClubsmodel!.data![i].id!),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(40, 168, 253, 1),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                cubit.listClubsmodel!.data![i]
                                                    .profile
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: text(
                                            title: cubit
                                                .listClubsmodel!.data![i].name
                                                .toString(),
                                            color: Color3,
                                            fontWeight: FontWeight.bold,
                                            //  "Al Jiyad Stables",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            fontSize: 17),
                                      ),
                                    ),
                                    if (cubit.idOfferClubModel != null &&
                                        cubit.idOfferClubModel!.clubs!.length >
                                            0)
                                      for (int ind = 0;
                                          ind <
                                              cubit.idOfferClubModel!.clubs!
                                                  .length;
                                          ind++)
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: cubit.idOfferClubModel!
                                                        .clubs![ind] ==
                                                    cubit.listClubsmodel!
                                                        .data![i].id
                                                ? Container(
                                                    width: width * 0.06,
                                                    height: height * 0.04,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        color: Colors.white60),
                                                    child: Center(
                                                      child: text(
                                                          title: "Offer",
                                                          color: Colors
                                                              .orangeAccent,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          //  "Al Jiyad Stables",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          maxLines: 1,
                                                          fontSize: 17),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                        )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: text(
                                    title: cubit
                                        .listClubsmodel!.data![i].description
                                        .toString(),
                                    // "288 McClure Court, Arkansasgffrehhhheeeeee",
                                    fontSize: 14,
                                    color: Colors.white60,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: cubit.listClubsmodel!.data!.length,
            ),
          );
  }
}
