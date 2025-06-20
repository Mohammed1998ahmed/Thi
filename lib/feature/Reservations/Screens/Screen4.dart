import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../Details_Club/cubit/home_stable_cubit.dart';
import 'ui/all_reviwe_screen_4.dart';
import 'ui/appBar_screen_4.dart';
import 'ui/number_review_screen_4.dart';
import 'ui/write_review_screen_4.dart';

class Screen4 extends StatelessWidget {
  final HomeStableCubit cubit;
  final int IdClub;
  Screen4({super.key, required this.cubit, required this.IdClub});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStableCubit()
        ..getDataClubGetRevewListModel(IdClub)
        ..postIsReservation(
            Club_Id: IdClub, User_Id: CachShpreafapp.getdata(key: "UserID"))
        ..userHasReviewInTrainerTrinner(
            Club_id: IdClub, idUser: CachShpreafapp.getdata(key: "UserID"))
        ..getRatingID(
            club_id: IdClub, user_id: CachShpreafapp.getdata(key: "UserID"))
        ..configurePusheCRating(Club_id: IdClub),
      child: BlocConsumer<HomeStableCubit, HomeStableState>(
        listener: (context, state) {
          if (state is MainScreenConfigPusheBookingEvent11) {
            cubit.getDataClubGetRevewListModel(IdClub);
            cubit.getRatingID(
                club_id: IdClub,
                user_id: CachShpreafapp.getdata(key: "UserID"));
          }
        },
        builder: (context, state) {
          final cubit = HomeStableCubit.getObject(context);

          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
            body: Container(
              height: height,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      cubit.isReservitionModel == null
                          ? Center(child: SpinkitWave())
                          : cubit.isReservitionModel!.status == false
                              ? Container()
                              : appBar_screen_4(width, height, cubit),
                      cubit.isReservitionModel == null
                          ? Center(child: SpinkitWave())
                          : cubit.isReservitionModel!.status == false
                              ? Container()
                              : write_review_screen_4(
                                  width, height, cubit, state,
                                  IdClub: IdClub),
                      Divider(
                        color: Color.fromRGBO(50, 52, 70, 1),
                        thickness: 1.0,
                      ),
                      number_review_screen_4(cubit),
                      cubit.getRevewListModel == null
                          ? Center(child: SpinkitWave())
                          : Container(
                              width: width,
                              height: height * 0.30,
                              child: ListView.separated(
                                // shrinkWrap: false,
                                itemCount: cubit.getRevewListModel!.reviews ==
                                        null
                                    ? 0
                                    : cubit.getRevewListModel!.reviews!.length,
                                separatorBuilder: (BuildContext, int) =>
                                    Divider(
                                  color: Color.fromRGBO(138, 134, 139, 0.8),
                                ),
                                itemBuilder: (context, index) {
                                  // ignore: unused_local_variable
                                  final conversation = conversations[index];
                                  return all_reviwe_screen_4(
                                      width, height, cubit, index, context,
                                      IdClub: IdClub);
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
