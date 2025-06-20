import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';

import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/TrinnerProfile/logic/cubit/trinner_cubit.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import 'ui/all_review_widght.dart';
import 'ui/details_all_revew_widght.dart';
import 'ui/text_review.dart';
import 'ui/textfromField_review_widght.dart';

// ignore: must_be_immutable
class ReviewTriner extends StatelessWidget {
  final int trainer_id;

  ReviewTriner({super.key, required this.trainer_id});

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrinnerCubit()
        ..getDataTrinnerGetRevewListModel(trainer_id)
        ..postIsReservation(
            trainer_id: trainer_id,
            User_Id: CachShpreafapp.getdata(key: "UserID"))
        ..userHasReviewInTrainerTrinner(
            trainer_id: trainer_id,
            idUser: CachShpreafapp.getdata(key: "UserID"))
        ..getRatingID(
            trainer_id: trainer_id,
            user_id: CachShpreafapp.getdata(key: "UserID"))
        ..configurePusheTRating(trainer_id: trainer_id),
      child: BlocConsumer<TrinnerCubit, TrinnerState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = TrinnerCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        cubit.reservedTrainerModel == null
                            ? Center(child: SpinkitWave())
                            : cubit.reservedTrainerModel!.status == false
                                ? Container()
                                : text_review(width, height, cubit),
                        cubit.reservedTrainerModel == null
                            ? Center(child: SpinkitWave())
                            : cubit.reservedTrainerModel!.status == false
                                ? Container()
                                : textfromField_review_widght(
                                    width, height, cubit, state,
                                    trainer_id: trainer_id),
                        Divider(
                          color: Color.fromRGBO(50, 52, 70, 1),
                          thickness: 1.0,
                        ),
                        all_review_widght(cubit),
                        cubit.getAllReviewUserByTrinner == null
                            ? Center(child: SpinkitWave())
                            : details_all_revew_widght(width, height, cubit,
                                trainer_id: trainer_id),
                      ],
                    ),
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
