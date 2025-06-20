import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/feature/Auction/AuctionShare/data/AddBideModel.dart';
import 'package:thi/feature/Auction/AuctionShare/data/getBuyerListModel.dart';
import 'package:thi/feature/Auction/AuctionShare/data/getCurentBidModel.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/configNotifaction/localNotifation.dart';
import 'package:thi/core/mPusherConig/piusherConfig.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

part 'actions_share_state.dart';

class ActionsShareCubit extends Cubit<ActionsShareState> {
  ActionsShareCubit() : super(ActionsShareInitial());

  static ActionsShareCubit getObject(context) => BlocProvider.of(context);
  AddBidModel? addBidModel;
  void postAddBid({required int Id_Auctions, required int amountAuctions}) {
    FormData formData = FormData.fromMap({"offeredPrice": amountAuctions});
    emit(ActionsShareAddBidLoading());
    DioHelper.postData("AddBid/${Id_Auctions}",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      addBidModel = AddBidModel.fromJson(value.data);
      if (addBidModel!.status == true) {
        getCurentBid(ID_Acutions: Id_Auctions);
      }
      Fluttertoast.showToast(
          msg: addBidModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 15,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ActionsShareAddBidSeccesfuly());
    }).catchError((onError) {
      emit(ActionsShareAddBidErorr());
    });
  }

  GetCurrntBidModel? getCurrntBidModel;
  void getCurentBid({required int ID_Acutions}) {
    emit(ActionsShareGetCurentBidLoading());
    DioHelper.getDataClub(
            endpoint: "getCurrentBid/${ID_Acutions}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getCurrntBidModel = GetCurrntBidModel.fromJson(value.data);
      emit(ActionsShareGetCurentBidSeccesfuly());
    }).catchError((onError) {
      emit(ActionsShareGetCurentBidErorr());
    });
  }

  GetBuyerListModel? getBuyerListModel;
  void getBuyerList({required int ID_Acutions}) {
    emit(ActionsShareGetBuyerLoading());
    DioHelper.getDataClub(
            endpoint: "getBuyersIN_Auction/${ID_Acutions}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getBuyerListModel = GetBuyerListModel.fromJson(value.data);
      emit(ActionsShareGetBuyerSeccesfuly());
    }).catchError((onError) {
      emit(ActionsShareGetBuyerErorr());
    });
  }

  void configurePusher1({required int ID_Acutions}) async {
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

          getCurentBid(ID_Acutions: ID_Acutions);
          getBuyerList(ID_Acutions: ID_Acutions);
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
                title: "Add Bid",
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
      await pusher.subscribe(
          channelName: "bid", onEvent: onEvent112(ID_Acutions));
      emit(MainScreenConfigPusheBooking1());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent112(int Id_Auction) {
    return (dynamic event) {
      getCurentBid(ID_Acutions: Id_Auction);
      getBuyerList(ID_Acutions: Id_Auction);
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      print(
          'Received event in customEventHandler with id: $Id_Auction - ${event.toString()}');
    };
  }
}
