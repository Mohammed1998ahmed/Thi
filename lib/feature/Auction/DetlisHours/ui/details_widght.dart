import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../AuctionShare/auctionShare.dart';
import '../logic/cubit/detlis_hours_cubit.dart';

Container details_widght(DetlisHoursCubit cubit, double height, double width,
    DateTime today, DateTime otherDate, BuildContext context,
    {required int IDActions, required bool isbid}) {
  return Container(
    margin: EdgeInsets.all(5),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Horse Name :  ',
                  style: TextStyle(
                    color: Color0,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w600,
                    // height: 0,
                  ),
                ),
                TextSpan(
                  text:
                      cubit.detailsActionsID!.auction!.horses!.name.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Gender : ',
                      style: TextStyle(
                        color: Color0,
                        fontSize: 18,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.w600,
                        // height: 0,
                      ),
                    ),
                    TextSpan(
                      text: cubit.detailsActionsID!.auction!.horses!.gender
                          .toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.w400,
                        // height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Birth Date : ',
                  style: TextStyle(
                    color: Color0,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w600,
                    // height: 0,
                  ),
                ),
                TextSpan(
                  text:
                      cubit.detailsActionsID!.auction!.horses!.birth.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Category : ',
                      style: TextStyle(
                        color: Color0,
                        fontSize: 18,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.w600,
                        // height: 0,
                      ),
                    ),
                    TextSpan(
                      text: cubit.detailsActionsID!.auction!.horses!.category
                          .toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        textBaseline: TextBaseline.alphabetic,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.w400,
                        // height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Color : ',
                  style: TextStyle(
                    color: Color0,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
                TextSpan(
                  text:
                      cubit.detailsActionsID!.auction!.horses!.color.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Location : ',
                  style: TextStyle(
                    color: Color0,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w600,
                    // height: 0,
                  ),
                ),
                TextSpan(
                  text: cubit.detailsActionsID!.auction!.horses!.address
                      .toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Owner : ',
                  style: TextStyle(
                    color: Color0,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w600,
                    // height: 0,
                  ),
                ),
                TextSpan(
                  text: cubit.detailsActionsID!.auction!.profile!.fName
                          .toString() +
                      " " +
                      cubit.detailsActionsID!.auction!.profile!.fName
                          .toString()
                          .toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Address : ',
                  style: TextStyle(
                    color: Color0,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w600,
                    // height: 0,
                  ),
                ),
                TextSpan(
                  text: cubit.detailsActionsID!.auction!.profile!.user!.email
                      .toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.w400,
                    // height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(15),
                        color: Color0),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Start of auction : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w600,
                            // height: 0,
                          ),
                        ),
                        Text(
                          cubit.detailsActionsID!.auction!.begin.toString(),
                          style: TextStyle(
                            color: Color(0xFFAC0000),
                            fontSize: 18,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w400,
                            // height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Color0,
                        borderRadius: BorderRadius.circular(15.0)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'End of Auction: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w600,
                            // height: 0,
                          ),
                        ),
                        Text(
                          cubit.detailsActionsID!.auction!.end.toString(),
                          style: TextStyle(
                            color: Color(0xFFAC0000),
                            fontSize: 18,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w400,
                            // height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.90,
                  height: height * 0.055,
                  //margin: EdgeInsets.fromLTRB(20, 20, 0.0, 10),
                  //  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Color0,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: text(
                        title:
                            'Price: ${cubit.detailsActionsID!.auction!.initialPrice.toString()} AED',
                        color: Color3,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: width * 0.90,
                  height: height * 0.055,
                  decoration: BoxDecoration(
                    color: Color0,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                  ),
                  child: cubit.getTimeActionModel == null
                      ? Container()
                      : Center(
                          child: text(
                              title:
                                  'Time left: ${cubit.getTimeActionModel!.daysLeft.toString()}d ${cubit.getTimeActionModel!.hoursLeft.toString()}h ${cubit.getTimeActionModel!.minutesLeft.toString()}m',
                              color: Color3,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          (today.year == otherDate.year &&
                  today.month == otherDate.month &&
                  today.day >= otherDate.day)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isbid
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => AuctionShare(
                                  ID_Auctions: IDActions,
                                  initAmount: cubit
                                      .detailsActionsID!.auction!.initialPrice!,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color4),
                              child: text(
                                  title: "Next", color: Color3, fontSize: 20),
                            ),
                          ))
                      : Center(
                          child: Container(
                            height: height * 0.090,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              color: Color0,
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(15),
                              shape: BoxShape.rectangle,
                            ),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  text(
                                      title: 'Current Bid',
                                      color: Color3,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    height: height * 0.003,
                                  ),
                                  text(
                                      title: '\$ 300',
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ],
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  cubit.makePayment(300, IDActions);
                                },
                                child: Container(
                                  width: width * .2,
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: text(
                                        title: 'Start',
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                )
              : Center(
                  child: Container(
                      child: text(title: "The auction has not started yet.")),
                ),
          SizedBox(
            height: height * 0.05,
          ),
        ],
      ),
    ),
  );
}
