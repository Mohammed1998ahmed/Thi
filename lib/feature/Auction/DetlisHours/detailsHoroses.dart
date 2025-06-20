import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Auction/AuctionShare/auctionShare.dart';
import 'package:thi/feature/Auction/DetlisHours/logic/cubit/detlis_hours_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import 'ui/appBar_widght.dart';
import 'ui/details_widght.dart';
import 'ui/images_widght.dart';
import 'ui/watch_video_widght.dart';

// ignore: must_be_immutable
class DetailsHoeoses extends StatelessWidget {
  // ignore: unused_field

  final List<String> images = [
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
  ];
  final int IDActions;
  DetailsHoeoses({super.key, required this.IDActions});
  bool isbid = false;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => DetlisHoursCubit()
        ..getDeaitlsActions(IDActions)
        ..GetTimeActionModelUpComing(idAuctions: IDActions)
        ..postShareAuctonBoolean(),
      child: BlocConsumer<DetlisHoursCubit, DetlisHoursState>(
        listener: (context, state) {
          if (state is FilterScreenTimeUpComingPayMentSceccfuly) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AuctionShare(
                  ID_Auctions: IDActions,
                  initAmount: state.detailsActionsID.auction!.initialPrice!,
                ),
              ),
            );
            CachShpreafapp.sevedata(
                key:
                    "boolBid${CachShpreafapp.getdata(key: "UserID")}${IDActions}",
                value: true);
          }
          if (state is DetlisHoursFavoiteRemoveSceccfuly) {}

          if (state is AuctionCalenderShareSceccfuly) {
            if (DetlisHoursCubit.getObject(context).boolShareAuction != null &&
                DetlisHoursCubit.getObject(context)
                        .boolShareAuction!
                        .auctions!
                        .length >
                    0)
              for (int ind = 0;
                  ind <
                      DetlisHoursCubit.getObject(context)
                          .boolShareAuction!
                          .auctions!
                          .length;
                  ind++)
                if (DetlisHoursCubit.getObject(context)
                        .boolShareAuction!
                        .auctions![ind] ==
                    IDActions) {
                  isbid = true;
                }
          }
        },
        builder: (context, state) {
          final cubit = DetlisHoursCubit.getObject(context);
          // print(cubit.detailsActionsID!.auction!.begin.toString());
          DateTime otherDate = DateTime.parse("2024-09-30");
          if (cubit.detailsActionsID != null) {
            otherDate = DateTime.parse(
                cubit.detailsActionsID!.auction!.begin.toString());
          }
          // DateTime otherDate = DateTime.parse(cubit.detailsActionsID!.auction!.begin.toString());
          return Scaffold(
            body: cubit.detailsActionsID == null
                ? Center(child: SpinkitWave())
                : SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imageBackground),
                            fit: BoxFit.fill),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          appBar_widght(context, height, cubit,
                              IDActions: IDActions),
                          images_widght(height, width, cubit),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          watch_video_widght(cubit, context),
                          details_widght(
                              cubit, height, width, today, otherDate, context,
                              IDActions: IDActions, isbid: isbid),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
