import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../nearby_screen/nearby_screen.dart';
import '../logic/cubit/home1_cubit.dart';

class CatagoryWidght extends StatelessWidget {
  const CatagoryWidght({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: cubit.gategoriesModel == null
          ? SpinkitWave()
          : Container(
              height: height * 0.2,
              width: width * 0.90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => NearbyScreen(
                            IdCategoires:
                                cubit.gategoriesModel!.categories![i].id!,
                          ),
                        ),
                      ); // print("object");
                      // setState(() {
                      //   about = false;
                      // });
                      cubit.chaingBoolean(false);
                      print(cubit.about.toString() + "mmmmmmmmm");
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.20,
                      padding: EdgeInsets.all(2),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        // color: Color.fromRGBO(71, 181, 255, 0.685),
                        borderRadius: BorderRadius.circular(15),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        ImagesPath +
                                            cubit.gategoriesModel!
                                                .categories![i].image
                                                .toString(),
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            // Image.network(
                            //   ImagesPath +
                            //       cubit.gategoriesModel!.categories![i].image
                            //           .toString(),
                            //   width: MediaQuery.of(context).size.width * 0.4,
                            //   height: MediaQuery.of(context).size.height * 0.1,
                            //   fit: BoxFit.contain,
                            // ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              child: text(
                                title: cubit
                                    .gategoriesModel!.categories![i].name
                                    .toString(),
                                fontSize: 12,
                                maxLines: 2,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                color: Color3,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: cubit.gategoriesModel!.categories!.length,
              ),
            ),
    );
  }
}
