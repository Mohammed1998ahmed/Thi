import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/Home.dart';
import '../../Home_Club/logic/cubit/home1_cubit.dart';

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
            height: height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                // reviewRaiting.add(false);
                // reviewRaiting.add(i)
                // reviewRaiting.addAll(i, false);
                // reviewRaiting[i] = false;
                reviewRaiting.addAll({i + 1: false});
                print(reviewRaiting.toString() +
                    "((((((((((((((((((((((9999999999999))))))))))))))))))))))");
                // cubit.getDataGetAverageRevewModel(
                //     cubit.listClubsmodel!.data![i].id!);
                return GestureDetector(
                  onTap: () {
                    print(
                        "999999999999999999999999999999999999999999999999999999");
                    Navigator.push<void>(
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
                    width: width * 0.25,
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color0,
                              blurRadius: 5,
                              offset: Offset(3, 5))
                        ]),
                    child: Stack(
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Home(
                                            Id: int.parse(cubit
                                                .listClubsmodel!.data![i].id
                                                .toString())),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
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
                                            color: Color4,
                                            fontWeight: FontWeight.bold,
                                            //  "Al Jiyad Stables",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            fontSize: 17),
                                      ),
                                    ),
                                    // TextButton.icon(
                                    //     onPressed: () {},
                                    //     icon: Icon(
                                    //       Icons.star_rate,
                                    //       color: Colors.amber,
                                    //     ),
                                    //     label: text(
                                    //       title: cubit.getAverageRevewModel!
                                    //           .averageRating
                                    //           .toString(),
                                    //       color: Colors.black,
                                    //     ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: text(
                                    title: cubit
                                        .listClubsmodel!.data![i].description
                                        .toString(),
                                    // "288 McClure Court, Arkansasgffrehhhheeeeee",
                                    fontSize: 12,
                                    color: Color4,
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
