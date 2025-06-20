import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Auction/AuctionCalender/logic/cubit/auction_calender_cubit.dart';
import 'package:thi/feature/Auction/Auctions/logic/cubit/auctions_cubit.dart';
import 'package:thi/feature/Auction/FilterScreen/filterScreen.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/CardWidght.dart';

class ActionsM extends StatefulWidget {
  const ActionsM({Key? key, required this.cubit1}) : super(key: key);
  final AuctionCalenderCubit cubit1;
  @override
  State<ActionsM> createState() => _ActionsMState();
}

class _ActionsMState extends State<ActionsM> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuctionsCubit(),
      child: BlocConsumer<AuctionsCubit, AuctionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = AuctionsCubit.getObject(context);
          return SafeArea(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
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
                        color: Color0,
                        size: 30,
                      )),
                  title: Center(
                    child: Container(
                      child: text(
                          title: "Auctions Calendar",
                          color: Color0,
                          fontSize: 20,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  actions: [
                    Container(
                      width: width * 0.1,
                    )
                  ],
                ),
                body: Container(
                  child: Column(
                    children: [
                      Divider(
                        color: Color.fromRGBO(50, 52, 70, 1),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.80,
                        child: widget.cubit1.getUpcomingActions!.dates == null
                            ? Center(child: text(title: "Not Found"))
                            : ListView.builder(
                                itemBuilder: ((context, index) {
                                  return widget.cubit1.getUpcomingActions ==
                                          null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ShimerWidght(
                                            height: height * 0.2,
                                            width: width * 0.90,
                                          ),
                                        )
                                      : CardWidght(
                                          context: context,
                                          subtitle: widget
                                              .cubit1
                                              .getUpcomingActions!
                                              .dates![index]
                                              .beginTime
                                              .toString(),
                                          title:
                                              "“Start of Season Auction 2024”",
                                          assetName: 'assets/images/img_21.png',
                                          onTap: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        filterScreen(
                                                  date: widget
                                                      .cubit1
                                                      .getUpcomingActions!
                                                      .dates![index]
                                                      .beginTime
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          });
                                }),
                                itemCount: widget
                                    .cubit1.getUpcomingActions!.dates!.length,
                              ),
                      )
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
