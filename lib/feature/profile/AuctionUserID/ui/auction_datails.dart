import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../Details/details.dart';
import '../logic/cubit/auction_user_cubit.dart';

GestureDetector auction_datails(BuildContext context, AuctionUserCubit cubit,
    int index, double width, double height) {
  return GestureDetector(
    onTap: () {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => DetailsHoeosesNav(
            profileAuctionModel: cubit.profileAuctionModel!,
            ID_Auction: index,
          ),
        ),
      );
    },
    child: Container(
      width: width,
      height: height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            width: width * 0.40,
            height: height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(ImagesPath +
                        cubit.profileAuctionModel!.auctions![index].horses!
                            .images![0]
                            .toString()),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: width * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        title: cubit
                            .profileAuctionModel!.auctions![index].description
                            .toString(),
                        color: Color0,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Birth Date : ',
                            style: TextStyle(
                              color: Color0,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: cubit.profileAuctionModel!.auctions![index]
                                .horses!.birth
                                .toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'InitialPrice : ',
                                style: TextStyle(
                                  color: Color0,
                                  fontSize: 14,
                                  fontFamily: 'Caveat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${cubit.profileAuctionModel!.auctions![index].initialPrice.toString()} AED',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Caveat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'offeredPrice : ',
                                style: TextStyle(
                                  color: Color0,
                                  fontSize: 14,
                                  fontFamily: 'Caveat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${cubit.profileAuctionModel!.auctions![index].offeredPrice != null ? cubit.profileAuctionModel!.auctions![index].offeredPrice.toString() : "No one has joined yet."} AED',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Caveat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cubit.profileAuctionModel!.auctions![index]
                                        .timeLeft!.daysLeft !=
                                    0 &&
                                cubit.profileAuctionModel!.auctions![index]
                                        .timeLeft!.hoursLeft !=
                                    0 &&
                                cubit.profileAuctionModel!.auctions![index]
                                        .timeLeft!.minutesLeft !=
                                    0
                            ? Color0
                            : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.03,
                      child: cubit.profileAuctionModel!.auctions![index]
                                      .timeLeft!.daysLeft !=
                                  0 &&
                              cubit.profileAuctionModel!.auctions![index]
                                      .timeLeft!.hoursLeft !=
                                  0 &&
                              cubit.profileAuctionModel!.auctions![index]
                                      .timeLeft!.minutesLeft !=
                                  0
                          ? text(
                              title:
                                  'Time left: ${cubit.profileAuctionModel!.auctions![index].timeLeft!.daysLeft.toString()}d ${cubit.profileAuctionModel!.auctions![index].timeLeft!.hoursLeft.toString()}h ${cubit.profileAuctionModel!.auctions![index].timeLeft!.minutesLeft.toString()}m',
                              color: Color3,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)
                          : text(
                              title: "The auction has ended." +
                                  cubit.profileAuctionModel!.auctions![index]
                                      .timeLeft!.daysLeft
                                      .toString(),
                              fontSize: 14,
                              color: Color3),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
