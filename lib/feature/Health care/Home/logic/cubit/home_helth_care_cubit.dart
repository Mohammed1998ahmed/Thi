import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/feature/Health%20care/Home/data/allOfferModel.dart';
import 'package:thi/feature/Health%20care/Home/data/htleathmodel.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../../../../core/mPusherConig/piusherConfig.dart';

part 'home_helth_care_state.dart';

class HomeHelthCareCubit extends Cubit<HomeHelthCareState> {
  HomeHelthCareCubit() : super(HomeHelthCareInitial());
  static HomeHelthCareCubit getObject(context) => BlocProvider.of(context);
  HealthCaresModel? healthCaresModel;
  void getHomeHelthCare() {
    emit(HomeHelthCareLoading());
    DioHelper.getDataClub(
            endpoint: "getAllHealthCaresUser",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      healthCaresModel = HealthCaresModel.fromJson(value.data);
      emit(HomeHelthCareSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthCareError());
    });
  }

  AlloffersModel? alloffersModel;
  void getHomeHelthOffers() {
    emit(HomeHelthCareOffersLoading());
    DioHelper.getDataClub(
            endpoint: "getOffersToday",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      alloffersModel = AlloffersModel.fromJson(value.data);
      print(alloffersModel!.offers![0].toString() +
          "7777777777777777777777777777777777777");
      emit(HomeHelthCareOffersSeccessfluy());
    }).catchError((onError) {
      emit(HomeHelthCareOffersError());
    });
  }

  void configurePusherOffers() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: (event) {
          // emit(MainScreenConfigPusheTrinnerEvent());
        },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(channelName: "Offers", onEvent: onEvent2());
      //  emit(MainScreenConfigPusheTrinner());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent2() {
    return (dynamic event) {
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      getHomeHelthOffers();
      print(
          'Received event in customEventHandler with id: - ${event.toString()}');
    };
  }

  void configurePusherHealthCare() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: (event) {
        //   emit(MainScreenConfigPusheTrinnerEvent());
        // },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(channelName: "HealthCare", onEvent: onEvent3());
      //  emit(MainScreenConfigPusheTrinner());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent3() {
    return (dynamic event) {
      getHomeHelthCare();
      // print(
      //     'Received event in customEventHandler with id: - ${event.toString()}');
    };
  }
}
