import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/feature/Auction/AuctionCalender/data/ToDayModel.dart';
import 'package:thi/feature/Auction/AuctionCalender/data/UpComingModels.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/configNotifaction/localNotifation.dart';
import 'package:thi/core/mPusherConig/piusherConfig.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../data/boolSaremodel.dart';

part 'auction_calender_state.dart';

class AuctionCalenderCubit extends Cubit<AuctionCalenderState> {
  AuctionCalenderCubit() : super(AuctionCalenderInitial());
  static AuctionCalenderCubit getObject(context) => BlocProvider.of(context);
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  bool shimer = true;

  void chaingP1(bool isP1) {
    this.p1 = isP1;
    this.p2 = false;
    emit(AuctionCalenderChaingP1());
  }

  void chaingP2(bool isP2) {
    this.p2 = isP2;
    this.p1 = false;
    emit(AuctionCalenderChaingP2());
  }

  void chaingP3(bool isP3) {
    this.p3 = isP3;
    emit(AuctionCalenderChaingP3());
  }

  bool isbutton = false;
  void chaingBoolean(bool onButton) {
    this.isbutton = onButton;
    emit(AuctionCalenderOnButton());
  }

  GetTodayActions? getTodayActions;
  void geTodyActions() {
    emit(AuctionCalenderTodayLoading());
    DioHelper.getDataClub(
            endpoint: "getTodayAuctions",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getTodayActions = GetTodayActions.fromJson(value.data);
      for (var i = 0; i < getTodayActions!.auctions!.length; i++) {
        CachShpreafapp.getdata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${getTodayActions!.auctions![i].horses!.auctionId}") ??
            CachShpreafapp.sevedata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${getTodayActions!.auctions![i].horses!.auctionId}",
                value: false);
      }
      emit(AuctionCalenderTodaySceccfuly());
    }).catchError((onError) {
      print(onError.toString() + "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      emit(AuctionCalenderTodayError());
    });
  }

  GetUpcomingActions? getUpcomingActions;
  void geUpcomingActions() {
    emit(AuctionCalenderUpcomingLoading());
    DioHelper.getDataClub(
            endpoint: "upcoming",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString() + "ldfkljlkjgllfsg");
      getUpcomingActions = GetUpcomingActions.fromJson(value.data);

      emit(AuctionCalenderUpcomingSceccfuly());
    }).catchError((onError) {
      print(onError.toString());
      emit(AuctionCalenderUpcomingError());
    });
  }

  void configurePusher1() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    // pusher.connectionState.
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: (event) {
          print(
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
          geTodyActions();
          geUpcomingActions();
          print(
              "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");

          print("onEventerererer: ${event.data}" +
              "BookingBookingBookingBookingBookingBooking");
          final data = json.decode(event.data);
          print("BookingBookingBookingBookingonEventerererer:: $event");

          if (data["message"] != null) {
            print("BookingBookingBookingBooking: ${data["message"]}" +
                "((((((((((BookingBookingBookingBooking:onEventerererer:onEventerererer:))))))))))");
            LocalNotifations.simpleLocalNotifation(
                title: "Add Auctions",
                body: data["message"].toString(),
                payload: "payload");
          }

          emit(MainScreenConfigPusheBookingEvent1());
        },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(channelName: "auction", onEvent: onEvent112);
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking1());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  void onEvent112(dynamic event) {
    print("BookingBookingBookingBookingonEvent: $event");

    emit(MainScreenConfigPusheBookingEvent1());
  }

  BoolShareAuction? boolShareAuction;
  void postShareAuctonBoolean() {
    emit(AuctionCalenderShareLoading());
    FormData formData =
        FormData.fromMap({"PID": CachShpreafapp.getdata(key: "ProfileID")});
    DioHelper.postData("Is_TheUser_In_or_Out_the_Auction",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      boolShareAuction = BoolShareAuction.fromJson(value.data);

      emit(AuctionCalenderShareSceccfuly());
    }).catchError((onError) {
      emit(AuctionCalenderShareError());
    });
  }
}
