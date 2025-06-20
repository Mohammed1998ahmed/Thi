import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'logic/cubit/auction_user_cubit.dart';
import 'ui/ShimerWidghtt.dart';
import 'ui/auction_datails.dart';

class AuctionNav extends StatelessWidget {
  const AuctionNav({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // bool shimmer = false;
    return BlocProvider(
      create: (context) => AuctionUserCubit()..geActionsByUser(),
      child: BlocConsumer<AuctionUserCubit, AuctionUserState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuctionUserCubit.getObject(context);
          return Scaffold(
            appBar: AppBar(
              title: text(
                  title: "AuctionNav",
                  color: Color0,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.99,
              child: cubit.profileAuctionModel == null
                  ? ListView.builder(
                      itemBuilder: (BuildContext, int) {
                        return ShimerWidghtt(width, height);
                      },
                      itemCount: 10,
                    )
                  : cubit.profileAuctionModel!.auctions == null
                      ? Center(
                          child: text(title: "not fount", color: Color0),
                        )
                      : ListView.separated(
                          itemCount:
                              cubit.profileAuctionModel!.auctions!.length,
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          // قم بتعيين عدد عناصر القائمة الخاصة بك
                          itemBuilder: (context, index) {
                            return auction_datails(
                                context, cubit, index, width, height);
                          },
                        ),
            ),
          );
        },
      ),
    );
  }
}
