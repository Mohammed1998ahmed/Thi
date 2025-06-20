import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/Reservations/Home_Club/data/CategoriesModel.dart';
import 'package:thi/feature/Reservations/Home_Club/data/SearchModel.dart';
import 'package:thi/feature/Reservations/Home_Club/data/listClubModel.dart';
import 'package:thi/feature/Reservations/Home_Club/data/offersClubsmodels.dart';
import 'package:thi/core/mPusherConig/piusherConfig.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../data/IdOffersClubs.dart';

part 'home1_state.dart';

class Home1Cubit extends Cubit<Home1State> {
  Home1Cubit() : super(Home1Initial());

  static Home1Cubit getObject(context) => BlocProvider.of(context);
  ListClubModel? listClubsmodel;
  TextEditingController SeachController = TextEditingController();
  void getDataClubList() {
    emit(Home1ListClubLoading());
    DioHelper.getDataClub(
            endpoint: "showAllClubs",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      listClubsmodel = ListClubModel.fromJson(value.data);
      // print(listClubsmodel!.images.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK");
      // for (var i = 0; i < listClubsmodel!.data!.length; i++) {

      //   CachShpreafapp.getdata(
      //           key:
      //               "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${listClubsmodel!.data![i].id}") ??
      //       CachShpreafapp.sevedata(
      //           key:
      //               "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${listClubsmodel!.data![i].id}",
      //           value: false);
      // }

      // print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(Home1ListClubSueccsufuly());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(Home1ListClubError());
    });
  }

  bool istoggel = true;
  void chaingBooleanSearch({required bool isChaing}) {
    this.istoggel = isChaing;
    emit(Home1ListClubBooleanSearch());
  }

  GetSearchModel? getSearchModel;
  void getDataSearch(String? search) {
    emit(Home1SearchClubLoading());
    DioHelper.getDataClub(
            endpoint: "searchClubByName/${search ?? 0}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getSearchModel = GetSearchModel.fromJson(value.data);

      if (getSearchModel!.status == true) {
        chaingBooleanSearch(isChaing: true);
      }
      if (getSearchModel!.status == false) {
        chaingBooleanSearch(isChaing: false);
      }
      Fluttertoast.showToast(
          msg: getSearchModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(Home1SearchClubSueccsufuly());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: "Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(Home1SearchClubError());
    });
  }

  bool isLoad = false;
  void chaingLoading(bool Loading) {
    this.isLoad = Loading;
    emit(Home1ChaingLoading());
  }

  bool about = true;
  void chaingBoolean(bool aboutPage) {
    this.about = aboutPage;
    emit(Home1ChaingBoolean());
  }

  void postSearch({required String Search}) {
    emit(Home1LoadingSearch());
    DioHelper.postData("Search", data: {"searchStable": Search}).then((value) {
      print("Sececcfully Search");
      emit(Home1SceccfullySearch());
    }).catchError((onError) {
      print("Error Search");
      emit(Home1ErrorSearch());
    });
  }

  List category = [
    {
      "image": "assets/images/paralympic equestrian-amico.png",
      "text": "Ability &",
    },
    {
      "image": "assets/images/paralympic equestrian-cuate.png",
      "text": "Flat race"
    },
    // {"image": "assets/images/img_12.png", "text": "Show horse"},
    // {"image": "assets/images/img_13.png", "text": "Pony"},
    {
      "image": "assets/images/horse jumping-bro.png",
      "text": "Race",
    },
  ];
  bool shimmer = false;
  void chaingshimmer() {}

  CategoriesModel? gategoriesModel;
  void getDateGaregories() {
    emit(HomeCategoriesClubLoading());
    DioHelper.getDataClub(
            endpoint: "allCategoryU",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      gategoriesModel = CategoriesModel.fromJson(value.data);

      emit(HomeCategoriesClubSueccsufuly());
    }).catchError((onError) {
      emit(HomeCategoriesClubError());
    });
  }

  IdOfferClubModel? idOfferClubModel;
  void getDateIDOfferClubs() {
    emit(HomeIdOffersClubLoading());
    DioHelper.getDataClub(
            endpoint: "Clubs_that_made_offer",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      idOfferClubModel = IdOfferClubModel.fromJson(value.data);

      emit(HomeIdOffersClubSueccsufuly());
    }).catchError((onError) {
      emit(HomeIdOffersClubError());
    });
  }

  void configurePusher() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    // pusher.connectionState.
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        onEvent: (event) {
          getDataClubList();
          emit(HomeCategoriesClubSueccsufulyPusher());
        },

        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // onConnectionStateChange: onConnectionStateChange,
        // onError: onError,
        // onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: onEvent,
        // onSubscriptionError: onSubscriptionError,
        // onDecryptionFailure: onDecryptionFailure,
        // onMemberAdded: onMemberAdded,
        // onMemberRemoved: onMemberRemoved,
        // authEndpoint: "<Your Authendpoint>",
        // onAuthorizer: onAuthorizer1,
      );
      await pusher.subscribe(channelName: "club", onEvent: onEventClub());
// await pusher.trigger(onEvent: onEvent1);

      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEventClub() {
    return (dynamic event) {
      getDataClubList();
      print(
          'Received event in customEventHandler with id: - ${event.toString()}');
    };
  }

  void configurePusherCategory() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    // pusher.connectionState.
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        onEvent: (event) {
          print(event.data.toString());
          getDateGaregories();
          emit(HomeCategoriesClubSueccsufulyPusherCategory());
        },

        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // onConnectionStateChange: onConnectionStateChange,
        // onError: onError,
        // onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onEvent: onEvent,
        // onSubscriptionError: onSubscriptionError,
        // onDecryptionFailure: onDecryptionFailure,
        // onMemberAdded: onMemberAdded,
        // onMemberRemoved: onMemberRemoved,
        // authEndpoint: "<Your Authendpoint>",
        // onAuthorizer: onAuthorizer1,
      );
      await pusher.subscribe(
          channelName: "category", onEvent: onEventCatergory());
// await pusher.trigger(onEvent: onEvent1);

      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEventCatergory() {
    return (dynamic event) {
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      getDateGaregories();
      print(
          'Received event in customEventHandler with id: - ${event.toString()}');
    };
  }

  void configurePusherOffer() async {
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
      await pusher.subscribe(channelName: "ClubOffers", onEvent: onEvent2);
      //  emit(MainScreenConfigPusheTrinner());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent2() {
    return (dynamic event) {
      getHomeHelthOffers();
      print(
          'Received event in customEventHandler with id: - ${event.toString()}');
    };
  }

  AlloffersClubsModel? alloffersModel;
  void getHomeHelthOffers() {
    emit(HomeOffersClubLoading());
    DioHelper.getDataClub(
            endpoint: "getOffersClubToday",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      alloffersModel = AlloffersClubsModel.fromJson(value.data);

      emit(HomeOffersClubSueccsufuly());
    }).catchError((onError) {
      emit(HomeOffersClubError());
    });
  }
}
