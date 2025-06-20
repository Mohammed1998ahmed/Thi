import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/test_widght/Detils/W9.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import '../Details_Club/cubit/home_stable_cubit.dart';

// ignore: must_be_immutable
class Screen2 extends StatelessWidget {
  final HomeStableCubit cubit;

  Screen2({super.key, required this.cubit});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStableCubit()
        ..getDataServic(cubit.clubIDModel!.club!.id!)
        ..configurePusherService(id_Club: cubit.clubIDModel!.club!.id!),
      child: BlocConsumer<HomeStableCubit, HomeStableState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeStableCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;

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
              child: Column(
                children: [
                  cubit.getServicClubModel == null
                      ? Container()
                      : Container(
                          width: width,
                          height: height * 0.4,
                          child: ListView.separated(
                            itemCount:
                                cubit.getServicClubModel!.services!.length,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            // قم بتعيين عدد عناصر القائمة الخاصة بك
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color0.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        offset: Offset(-1, 6),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        scale: 1,
                                        image: NetworkImage(
                                          ImagesPath +
                                              cubit.getServicClubModel!
                                                  .services![index].image!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: text(
                                  title: cubit.getServicClubModel!
                                      .services![index].name!,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Color0,
                                ),
                                subtitle: text(
                                  title: cubit.getServicClubModel!
                                      .services![index].description!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(3, 2, 3, 1),
                                ),
                                onTap: () {
                                  // تنفيذ الإجراء عند النقر على السطر
                                  print('تم النقر على السطر');
                                },
                              );
                            },
                          ),
                        ),
                  secrbool1
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          Detiels(
                                              imagename:
                                                  'assets/images/img_21.png'),
                                    ),
                                  );
                                }),
                                child: Container(
                                  width: width,
                                  height: height * 0.4,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/img_21.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  text(
                                      title: "Jumping Package ",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                  Spacer(),
                                  text(
                                    title: "Book Now",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(190, 140, 206, 1),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  text(
                                      title:
                                          "Completed Package Offer till Sep 18, 2023",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  Spacer(),
                                  text(
                                      title: "450 AED",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
