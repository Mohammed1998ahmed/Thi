import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/feature/Reservations/Details_Club/cubit/home_stable_cubit.dart';
import 'package:thi/feature/Reservations/Screens/Screen1.dart';
import 'package:thi/feature/Reservations/Screens/Screen2.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';
import 'package:thi/feature/Reservations/Screens/Screen3.dart';
import 'package:thi/feature/Reservations/Screens/Screen4.dart';

import 'ui/image_stack.dart';
import 'ui/specialists.dart';
import 'ui/tabBar_text.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final int Id;

  Home({super.key, required this.Id});

  bool favorate = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStableCubit()
        ..getDataClubProfile(Id)
        ..getDataClubProfileTrainer(Id)
        ..getDataClubGetRevewListModel(Id)
        ..getDataGetAverageRevewModel(Id)
        ..configurePusher(id_Club: Id)
        ..configurePusheCRating2(Club_id: Id),
      child: BlocConsumer<HomeStableCubit, HomeStableState>(
        listener: (context, state) {
          if (state is HomeStableValueProfileFavoratieSeccsfuly) {
            favorate = true;
          }
          if (state is HomeStableValueProfileRemoveFavoratieSeccsfuly) {
            favorate = false;
          }
          if (state is Home1EverageClubSueccsufuly) {}
        },
        builder: (context, state) {
          final cubit = HomeStableCubit.getObject(context);
          print(CachShpreafapp.getdata(key: "UserID").toString());

          return Scaffold(
              body: cubit.clubIDModel == null &&
                      cubit.myClubTrenerIDModel == null
                  ? Center(
                      child: SpinkitWave(),
                    )
                  : SingleChildScrollView(
                      child: Column(children: [
                        image_stack(context, cubit, Id: Id),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.30,
                          // color: Color.fromRGBO(90, 60, 98, 0.15),
                          color: Color.fromRGBO(71, 181, 255, 0.39),

                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(40, 168, 253, 1),
                                          Color.fromRGBO(
                                              71, 181, 255, 1), // اللون الأصلي
                                          Color.fromRGBO(134, 255, 255,
                                              1), // اللون المتناسق
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: text(
                                          title: "Stable specialists",
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  specialists(context, cubit),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                ]),
                          ),
                        ),
                        /////////////////

                        Container(
                          height: MediaQuery.of(context).size.height * .6,
                          // color: Colors.pink,
                          child: DefaultTabController(
                              length: 4,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  // color: Colors.pink,
                                  child: Column(children: [
                                    tabBar_text(),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Screen1(
                                            cubit: cubit,
                                          ),
                                          Screen2(
                                            cubit: cubit,
                                          ),
                                          Screen3(
                                            cubit: cubit,
                                          ),
                                          Screen4(
                                            IdClub: Id,
                                            cubit: cubit,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]))),
                        ),
                      ]),
                    ));
        },
      ),
    );
  }
}
