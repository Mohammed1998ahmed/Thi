import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/Reservations/Details_Club/data/ClubIDmodel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/EvarageModel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/FavoratieModel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/GetServiceIDClubs.dart';
import 'package:thi/feature/Reservations/Details_Club/data/IsResavtions.dart';
import 'package:thi/feature/Reservations/Details_Club/data/RevewListModelGet.dart';
import 'package:thi/feature/Reservations/Details_Club/data/SendRevew.dart';
import 'package:thi/feature/Reservations/Details_Club/data/TraninerModel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/TrinerIdByClub.dart';
import 'package:thi/feature/Reservations/Details_Club/data/deleteReviewClub.dart';
import 'package:thi/feature/Reservations/Details_Club/data/getRatingIDMoel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/modelClubget.dart';
import 'package:thi/feature/Reservations/Details_Club/data/ratingModel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/removeFavoratiemodel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/reserviationReviewModel.dart';
import 'package:thi/feature/Reservations/Details_Club/data/updataReview.dart';
import 'package:thi/core/mPusherConig/piusherConfig.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../../../../core/component/conset/Const.dart';

part 'home_stable_state.dart';

class HomeStableCubit extends Cubit<HomeStableState> {
  HomeStableCubit() : super(HomeStableInitial());
  static HomeStableCubit getObject(context) => BlocProvider.of(context);
  bool favorate = false;
  chaingFavorite(bool favoratie) {
    this.favorate = favoratie;
    emit(HomeStableChaingFavorite());
  }

  List<bool> isSelected = [
    true,
    false,
  ];

  int selectedButton = 0;

  void seclectPage(int index) {
    if (index == 1) {
      secrbool1 = false;
    } else {
      secrbool1 = true;
    }
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      isSelected[buttonIndex] = buttonIndex == index;
    }

    selectedButton = index;
    emit(HomeStableChaingPageService());
  }

  double rating = 0.0;
  void chaingStar(double valueStar) {
    rating = valueStar;
    emit(HomeStableValueStar());
  }

  GetServicClubModel? getServicClubModel;
  void getDataServic(int IdClub) {
    emit(BookingServicLoading());
    DioHelper.getDataClub(
            endpoint: "allServicesU/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getServicClubModel = GetServicClubModel.fromJson(value.data);

      emit(BookingServicSuccsfuly());
    }).catchError((onError) {
      emit(BookingServicError());
    });
  }

  ClubIDModel? clubIDModel;
  ClubProfileGetModel? clubProfileGetModel;
  void getDataClubProfile(int id) {
    emit(HomeStableValueProfileLoading());
    DioHelper.getDataClub(
            endpoint: "getClubByID/${id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      clubIDModel = ClubIDModel.fromJson(value.data);

      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileSeccsfuly());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileError());
    });
  }

  MyClubTrenerIDModel? myClubTrenerIDModel;
  TrinerProfileGetModel? trinerProfileGetModel;
  void getDataClubProfileTrainer(int Id) {
    emit(HomeStableValueProfileLoadingTrainer());
    DioHelper.getDataClub(
            endpoint: "GetTrainersByClub/${Id}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      myClubTrenerIDModel = MyClubTrenerIDModel.fromJson(value.data);

      Fluttertoast.showToast(
          msg: myClubTrenerIDModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileSeccsfulyTrainer());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: myClubTrenerIDModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileErrorTrainer());
    });
  }

  //////////////////////////////////// real time
  void configurePusher({required int id_Club}) async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
      await pusher.init(
        apiKey: "e5d6ede1b86a447371cc",
        cluster: "eu",
        useTLS: true,
        // authEndpoint: "https://192.168.109.241:8000/api/pusher/authenticate",
        // onEvent: (event) {
        //   print(event.data.toString());
        // },
        // onError: (String moh, int? id, dynamic inmess) {
        //   print(moh + id.toString() + inmess.toString());
        // },
        // authEndpoint: ,
        // authParams: ,
        // useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: (event) {
          getDataClubProfileTrainer(id_Club);

          print(" onEvent : ${event.data}" + " onEvent");
          final data = json.decode(event.data);
          print("100onEventerererer: $event");

          if (data["message"] != null) {
            print(" onEvent : ${data["message"]}" + "onEvent 1");
          }

          emit(MainScreenConfigPusheTrinnerEvent());
        },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(
          channelName: "trainer", onEvent: onEvent11(id_Club));
      emit(MainScreenConfigPusheTrinner());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent11(int idClub) {
    return (dynamic event) {
      getDataClubProfileTrainer(idClub);

      print(
          'Received event in customEventHandler with id: $idClub - ${event.toString()}');
    };
  }

  void configurePusherService({required int id_Club}) async {
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
          emit(MainScreenConfigPusheTrinnerEvent());
        },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(
          channelName: "Services", onEvent: onEvent2(id_Club));
      emit(MainScreenConfigPusheTrinner());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent2(int idClub) {
    return (dynamic event) {
      getDataServic(idClub);

      print(
          'Received event in customEventHandler with id: $idClub - ${event.toString()}');
    };
  }

  FavoratieModel? favoratieModel;
  void postFavoratie(int idClube, int idUser) {
    emit(HomeStableValueProfileFavoratieLoading());
    DioHelper.postData("addClubToFavorites",
            data: {"user_id": idUser, "club_id": idClube},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      favoratieModel = FavoratieModel.fromJson(value.data);
      chaingFavorite(true);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${idClube}",
          value: true);
      emit(HomeStableValueProfileFavoratieSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableValueProfileFavoratieError());
    });
  }

  RemovefavoratieModel? removefavoratieModel;

  void postRemoveFavoratie(int idClube, int idUser) {
    emit(HomeStableValueProfileRemoveFavoratieLoading());
    DioHelper.postData("removeClubFromFavorites",
            data: {"user_id": idUser, "club_id": idClube},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      favoratieModel = FavoratieModel.fromJson(value.data);
      chaingFavorite(false);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratie${CachShpreafapp.getdata(key: "UserID")}${idClube}",
          value: false);

      print("objectfffffffffffffffffffffffrrrrrrrrrrrrrrrrrrrr");
      emit(HomeStableValueProfileRemoveFavoratieSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableValueProfileRemoveFavoratieError());
    });
  }

  GetRevewListModel? getRevewListModel;
  void getDataClubGetRevewListModel(int IdClub) {
    emit(HomeStableValueProfileLoadingGetRevewListModel());
    DioHelper.getDataClub(
            endpoint: "getAllReviewsInClub/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getRevewListModel = GetRevewListModel.fromJson(value.data);

      print(value.data.toString());
      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileSeccsfulyGetRevewListModel());
    }).catchError((onError) {
      print("object");
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueProfileErrorGetRevewListModel());
    });
  }

  DeleteReviewClub? deleteRating;
  void deleteRevewTrinner({
    required int Club_id,
    required int rating_id,
    required int idUser,
  }) {
    emit(HomeStableDeleteRviewClubLoading());
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "user_id": idUser,
    });
    DioHelper.postData("deleteClubRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deleteRating = DeleteReviewClub.fromJson(value.data);

      getDataClubGetRevewListModel(Club_id);
      getDataGetAverageRevewModel(Club_id);
      getRatingID(
          club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));

      emit(HomeStableDeleteRviewClubSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableDeleteRviewClubError());
    });
  }

  ReviewInClubReviewClub? userHasReviewInClub;
  void userHasReviewInTrainerTrinner({
    required int Club_id,
    required int idUser,
  }) {
    emit(HomeStableReservationRviewClubLoading());
    print(Club_id.toString() + idUser.toString());
    FormData formData = FormData.fromMap({
      "club_id": Club_id,
      "user_id": idUser,
    });
    DioHelper.postData("userHasReviewInClub",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      userHasReviewInClub = ReviewInClubReviewClub.fromJson(value.data);

      getDataClubGetRevewListModel(Club_id);
      getDataGetAverageRevewModel(Club_id);

      emit(HomeStableReservationRviewClubSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableReservationRviewClubError());
    });
  }

  GetFavorateRatingModel? getFavorateRatingModel;
  void getDataClubGetGetFavorateRatingModel(int IdClub) {
    emit(HomeStableValueRatingLoading());
    DioHelper.getDataClub(
            endpoint: "allAverageClubRating/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getFavorateRatingModel = GetFavorateRatingModel.fromJson(value.data);

      Fluttertoast.showToast(
          msg: "Ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueRatingSueccsfuly());
    }).catchError((onError) {
      print("object");
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(HomeStableValueRatingError());
    });
  }

  TextEditingController controllerSend = TextEditingController();

  PostSendRevewModel? postSendRevewModel;
  void postGetSendRevewModel(
      {required int idClube,
      required int idUser,
      int? rating,
      String? review}) {
    emit(HomeStableValueSendRevewLoading());
    print(idClube.toString() +
        idUser.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");

    FormData formData = FormData.fromMap({
      "club_id": idClube,
      "user_id": idUser,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("createClubRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      // favoratieModel = FavoratieModel.fromJson(value.data);
      // // chaingFavorite(true);

      postSendRevewModel = PostSendRevewModel.fromJson(value.data);
      CachShpreafapp.sevedata(
          key: "ratingID", value: postSendRevewModel!.rating!.id!);
      print(postSendRevewModel!.rating!.id.toString() +
          "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");

      userHasReviewInTrainerTrinner(
          Club_id: idClube, idUser: CachShpreafapp.getdata(key: "UserID"));
      getDataClubGetRevewListModel(idClube);
      getDataGetAverageRevewModel(idClube);
      emit(HomeStableValueSendRevewSueccsfuly());
    }).catchError((onError) {
      print(onError.toString() + "7777777777777777777777777777777");
      emit(HomeStableValueSendRevewError());
    });
  }

  UpdataClubReviewClub? updataClubReviewClub;
  void updataReviewSendRevewClub(
      {required int Club_id,
      required int rating_id,
      required int idUser,
      int? rating,
      String? review}) {
    emit(HomeStableUpdataRviewClubLoading());
    print(rating_id.toString() +
        idUser.toString() +
        rating.toString() +
        review.toString() +
        "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
    FormData formData = FormData.fromMap({
      "rating_id": rating_id,
      "user_id": idUser,
      "rating": rating,
      "review": review.toString()
    });
    DioHelper.postData("updateClubRating",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      updataClubReviewClub = UpdataClubReviewClub.fromJson(value.data);

      if (updataClubReviewClub!.status == true) {
        controllerSend.clear();
        rating = 0;
      }

      getDataClubGetRevewListModel(Club_id);
      getDataGetAverageRevewModel(Club_id);
      getRatingID(
          club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));

      emit(HomeStableUpdataRviewClubSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableUpdataRviewClubError());
    });
  }

  GetAverageRevewModel? getAverageRevewModel;
  void getDataGetAverageRevewModel(int IdClub) {
    emit(Home1EverageClubLoading());
    DioHelper.getDataClub(
            endpoint: "allAverageClubRating/${IdClub}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getAverageRevewModel = GetAverageRevewModel.fromJson(value.data);

      emit(Home1EverageClubSueccsufuly());
    }).catchError((onError) {
      print("object" + onError.toString());

      emit(Home1EverageClubError());
    });
  }

///////////////
  IsReservitionModel? isReservitionModel;
  void postIsReservation({required int Club_Id, required int User_Id}) {
    emit(BookingServicISRaserationLoading());
    FormData formData = FormData.fromMap({"club": Club_Id, "user_id": User_Id});
    DioHelper.postData("isReserved",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      isReservitionModel = IsReservitionModel.fromJson(value.data);
      emit(BookingServicISRaserationSuccsfuly());
    }).catchError((onError) {
      emit(BookingServicISRaserationError());
    });
  }

  GetRatingIDModel? getRatingModel;
  void getRatingID({
    required int club_id,
    // required int rating_id,
    required int user_id,
  }) {
    emit(HomeStableRatingIDLoading());
    print(user_id.toString() + rating.toString());
    FormData formData = FormData.fromMap({
      "club_id": club_id,
      "user_id": user_id,
    });
    DioHelper.postData("getRatingIDByUserClub",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getRatingModel = GetRatingIDModel.fromJson(value.data);
      print(getRatingModel!.id == null
          ? "0"
          : getRatingModel!.id.toString() +
              "objectffffffffffffffffffdfdfdfdfdfdfdffffff");
      print("88888888888888888888888888888888888888888888888");
      emit(HomeStableRatingIDSeccsfuly());
    }).catchError((onError) {
      emit(HomeStableRatingIDError());
    });
  }

  /////////////////////////////////real time rievew
  void configurePusheCRating({required int Club_id}) async {
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
        onEvent: (event) {},
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(
          channelName: "CRating", onEvent: onEvent112(Id_Club: Club_id));
      emit(MainScreenConfigPusheBooking1());
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent112({required int Id_Club}) {
    return (dynamic event) {
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      getRatingID(
          club_id: Id_Club, user_id: CachShpreafapp.getdata(key: "UserID"));
      getDataGetAverageRevewModel(Id_Club);
      getDataClubGetRevewListModel(Id_Club);
    };
  }

  void configurePusheCRating2({required int Club_id}) async {
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
        onEvent: (event) {},
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(
          channelName: "CRating", onEvent: onEvent11222(Id_Club: Club_id));
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking1());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  Function onEvent11222({required int Id_Club}) {
    return (dynamic event) {
      // قم بتنفيذ العمليات المطلوبة هنا باستخدام event و id
      getRatingID(
          club_id: Id_Club, user_id: CachShpreafapp.getdata(key: "UserID"));
      getDataGetAverageRevewModel(Id_Club);
      getDataClubGetRevewListModel(Id_Club);
    };
  }

  void configurePusher11({required int Club_id}) async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
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
          getRatingID(
              club_id: Club_id, user_id: CachShpreafapp.getdata(key: "UserID"));
          getDataGetAverageRevewModel(Club_id);

          print("onEventerererer: ${event.data}" +
              "BookingBookingBookingBookingBookingBooking");
          final data = json.decode(event.data);
          print("BookingBookingBookingBookingonEventerererer:: $event");

          if (data["message"] != null) {
            print("BookingBookingBookingBooking: ${data["message"]}" +
                "((((((((((BookingBookingBookingBooking:onEventerererer:onEventerererer:))))))))))");
          }

          emit(MainScreenConfigPusheBookingEvent11());
        },
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
      );
      await pusher.subscribe(channelName: "CRating", onEvent: onEvent112);
// await pusher.trigger(onEvent: onEvent1);
      emit(MainScreenConfigPusheBooking11());
      // await pusher.onev
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e" + e.toString());
    }
  }

  void onEvent1122(dynamic event) {
    print("BookingBookingBookingBookingonEvent: $event");

    emit(MainScreenConfigPusheBookingEvent11());
  }
}
