import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Details_Club/Home.dart';
import '../logic/cubit/neabry_screen_cubit.dart';

class PopularStablesNearbyWidght extends StatelessWidget {
  const PopularStablesNearbyWidght({
    super.key,
    required this.height,
    required this.width,
    required this.cubit,
  });

  final double height;
  final double width;
  final NeabryScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return cubit.clubIDCategoriesModel == null
        ? SpinkitWave()
        : Container(
            height: height * 0.780,
            child: cubit.clubIDCategoriesModel!.clubs == null
                ? Center(
                    child: text(title: "Not found Clubs"),
                  )
                : GridView.builder(
                    // scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // تحديد عدد الأعمدة هنا
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio:
                          0.8, // تحديد نسبة العرض إلى الارتفاع هنا
                    ),
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Home(
                                  Id: int.parse(cubit
                                      .clubIDCategoriesModel!.clubs![i].id
                                      .toString())),
                            ),
                          );
                        },
                        child: Container(
                          // تعديل العرض والارتفاع هنا
                          width: width * 0.4,
                          height: height * 0.05,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(71, 181, 255, 1),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(40, 168, 253, 1),
                                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                                Color.fromRGBO(
                                    199, 255, 255, 1), // اللون المتناسق
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.6,
                                      height: height * 0.15,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                cubit.clubIDCategoriesModel!
                                                    .clubs![i].profile
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        text(
                                          title: cubit.clubIDCategoriesModel!
                                              .clubs![i].name
                                              .toString(),
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: text(
                                        title: cubit.clubIDCategoriesModel!
                                            .clubs![i].description
                                            .toString(),
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        color: Colors.white60,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.clubIDCategoriesModel!.clubs!.length,
                  ),
          );
  }
}
