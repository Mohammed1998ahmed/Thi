import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/Home.dart';
import '../logic/cubit/home1_cubit.dart';

class BestStablesSearchWidght extends StatelessWidget {
  const BestStablesSearchWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
    required this.home1state,
  });

  final double height;
  final double width;
  final Home1Cubit cubit;
  final Home1State home1state;
  @override
  Widget build(BuildContext context) {
    return home1state is Home1SearchClubLoading
        ? Center(child: SpinkitWave())
        : Container(
            height: height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(
                          Id: int.parse(
                              cubit.getSearchModel!.clubs![i].id.toString()),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.55,
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(71, 181, 255, 0.753),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(71, 181, 255, 0.753),
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
                                                .getSearchModel!.clubs![i].id
                                                .toString())),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                cubit.getSearchModel!.clubs![i]
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
                                                .getSearchModel!.clubs![i].name
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
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: text(
                                    title: cubit
                                        .getSearchModel!.clubs![i].description
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
              itemCount: cubit.getSearchModel!.clubs!.length,
            ),
          );
  }
}
