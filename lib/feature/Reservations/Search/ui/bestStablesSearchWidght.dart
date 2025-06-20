import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/Home.dart';
import '../../Home_Club/logic/cubit/home1_cubit.dart';

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
        ? Center(child: shimmerWidght(height, width))
        : Container(
            height: height * 0.80,
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                // reviewRaiting.add(false);
                // print(reviewRaiting.toString() +
                //     "((((((((((((((((((((((9999999999999))))))))))))))))))))))");
                // cubit.getDataGetAverageRevewModel(
                //     cubit.listClubsmodel!.data![i].id!);
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
                    height: height * 0.1,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                          Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color0,
                          blurRadius: 5,
                          offset: Offset(3, 5),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      leading: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: NetworkImage(
                              ImagesPath +
                                  cubit.getSearchModel!.clubs![i].profile
                                      .toString(),
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      title: text(
                        title: cubit.getSearchModel!.clubs![i].name.toString(),
                        color: Color4,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        fontSize: 17,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: text(
                          title: cubit.getSearchModel!.clubs![i].description
                              .toString(),
                          fontSize: 12,
                          color: Color4,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cubit.getSearchModel!.clubs!.length,
            ),
          );
  }

  ///////////////////////////////////////////////////////////////////
  Container shimmerWidght(double width, double height) {
    return Container(
        width: width,
        height: height,
        child: ListView.builder(
          itemBuilder: (BuildContext, int) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ShimerWidght(
                  width: width * 0.2,
                  height: height * 0.3,
                  reduis: 10,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 6),
                  child: ShimerWidght(
                    width: width * 0.02,
                    height: height * 0.02,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 6),
                  child: ShimerWidght(
                    width: width * 0.02,
                    height: height * 0.03,
                  ),
                ),
                // trailing: ShimerWidght(
                //   width: width * 0.2,
                //   height: height * 0.05,
                //   reduis: 30,
                // ),
              ),
            );
          },
          itemCount: 10,
        ));
  }
}
