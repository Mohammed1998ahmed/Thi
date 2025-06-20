import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../AuctionCalender/logic/cubit/auction_calender_cubit.dart';

Padding AuctionHours(
    {required BuildContext context,
    void Function()? onTap,
    required String assetName,
    required String title1,
    required String textName,
    required String textColor,
    required String textGender,
    required String textBirthData,
    required String textPrice,
    required int ID_Auction,
    required AuctionCalenderCubit AuctionCalenderCubit}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.44,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color0.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(ImagesPath + assetName),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                      title: title1,
                      color: Color0,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Name : ',
                          style: TextStyle(
                            color: Color0,
                            fontSize: 14,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: textName,
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
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Color : ',
                          style: TextStyle(
                            color: Color0,
                            fontSize: 14,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: textColor,
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
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Gender : ',
                          style: TextStyle(
                            color: Color0,
                            fontSize: 14,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: textGender,
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
                          text: textBirthData,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Price : ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 14,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: textPrice,
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
                      // CachShpreafapp.getdata(
                      //                 key:
                      //                     "boolBid${CachShpreafapp.getdata(key: "UserID")}${ID_Auction}")
                      //             as bool? ??
                      //         false
                      if (AuctionCalenderCubit.boolShareAuction != null &&
                          AuctionCalenderCubit
                                  .boolShareAuction!.auctions!.length >
                              0)
                        for (int ind = 0;
                            ind <
                                AuctionCalenderCubit
                                    .boolShareAuction!.auctions!.length;
                            ind++)
                          AuctionCalenderCubit
                                      .boolShareAuction!.auctions![ind] ==
                                  ID_Auction
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  alignment: AlignmentDirectional.center,
                                  child: text(
                                      title: "You are subscribed",
                                      color: Color3),
                                )
                              : Container()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
