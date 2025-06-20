import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:thi/feature/Reservations/Location/locationStabe.dart';

import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/favovoriteIstable/logic/cubit/favovrite_cubit.dart';

class Istable extends StatelessWidget {
  const Istable({super.key, required this.favovriteCubit, required this.index});

  Future<void> shareText({String? nameStable}) async {
    try {
      await FlutterShare.share(
          title: 'Share',
          text: nameStable ?? "Tlkjkljjjljlj HI",
          chooserTitle: "mohammed ahmed "
          // subject: "subject",
          );
    } catch (e) {
      print('Error sharing: $e');
    }
  }

  final FavovriteCubit favovriteCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.46,
          decoration: BoxDecoration(
            color: Color.fromRGBO(71, 181, 255, 0.493),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(71, 181, 255, 0.144),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(2, -6),
              ),
            ],
          ),
          // color: Colors.yellow,
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                    image: NetworkImage(ImagesPath +
                        favovriteCubit
                            .getFavoratieModle!.favoriteClubs![index].profile!),
                    fit: BoxFit.cover),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(
                            title: favovriteCubit
                                .getFavoratieModle!.favoriteClubs![index].name!,
                            // "Godolphin Stables",
                            color: Color3,
                            fontSize: 22,
                            fontWeight: FontWeight.w900),
                        text(
                            title: favovriteCubit.getFavoratieModle!
                                .favoriteClubs![index].website!,
                            color: Color3,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ]),
                ),
              ),
              body: Column(children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBookandDirectionandShare(
                        context: context,
                        onTap: () {},
                        title: "book",
                        icon: Icons.book),
                    ButtonBookandDirectionandShare(
                        context: context,
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => LocationStable(
                                latitude: 24.4539,
                                longitude: 54.3773,
                              ),
                            ),
                          );
                        },
                        title: "Direction",
                        icon: Icons.location_on_outlined),
                    ButtonBookandDirectionandShare(
                        context: context,
                        onTap: () {
                          shareText(nameStable: "Direction");
                        },
                        title: "share",
                        icon: Icons.share),
                  ],
                )
              ]),
            )
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.54,

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
          // color: Color0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.051,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
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
                          title: "About",
                          color: Color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    child: text(
                        title: favovriteCubit.getFavoratieModle!
                            .favoriteClubs![index].description!,
                        // "Originally surrounded by desert sands, Godolphin’s Al Quoz stables are located in the heart of the growing city of Dubai, with a dramatic skyline backdrop.Read more",
                        color: Color.fromRGBO(0, 0, 0, 0.54),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                              Color.fromRGBO(
                                  199, 255, 255, 1), // اللون المتناسق
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: text(
                              title: "Opening Hours",
                              color: Color3,
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.019,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color0,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: favovriteCubit.getFavoratieModle!
                              .favoriteClubs![index].day!.length,
                          itemBuilder: (BuildContext context, int index1) {
                            print(favovriteCubit.getFavoratieModle!
                                    .favoriteClubs![index].day!.length
                                    .toString() +
                                "LLLLLLLLLLLLLLLLLL");
                            return Container(
                              // color: Color0,
                              width: MediaQuery.of(context).size.width * 0.38,
                              height: MediaQuery.of(context).size.height * 0.03,
                              child: text(
                                  title: favovriteCubit.getFavoratieModle!
                                      .favoriteClubs![index].day![index1]
                                      .toString(),
                                  color: Color.fromRGBO(0, 0, 0, 0.54),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Container(
                          child: text(
                              title: favovriteCubit.getFavoratieModle!
                                      .favoriteClubs![index].start
                                      .toString() +
                                  " _ " +
                                  favovriteCubit.getFavoratieModle!
                                      .favoriteClubs![index].end
                                      .toString(),
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي
                                      Color.fromRGBO(
                                          199, 255, 255, 1), // اللون المتناسق
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: text(
                                      title: "Address",
                                      color: Color3,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              text(
                                  title: favovriteCubit.getFavoratieModle!
                                      .favoriteClubs![index].address!,
                                  // "57G5+46R - Dubai",
                                  color: Color.fromRGBO(0, 0, 0, 0.54),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .080),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        //////////////////////////
      ]),
    ));
  }

  GestureDetector ButtonBookandDirectionandShare(
      {required BuildContext context,
      void Function()? onTap,
      IconData? icon,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white54,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Color0,
              child: Icon(
                icon ?? Icons.book,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          text(
              title: title,
              color: Color.fromRGBO(0, 0, 0, 0.54),
              fontSize: 15,
              fontWeight: FontWeight.w500)
        ],
      ),
    );
  }
}
