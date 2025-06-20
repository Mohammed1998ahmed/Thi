import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/profile/hospetel/data/modelhospitle.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../../../../core/mPusherConig/piusherConfig.dart';

part 'hospatel_state.dart';

class HospatelCubit extends Cubit<HospatelState> {
  HospatelCubit() : super(HospatelInitial());
  static HospatelCubit getObject(context) => BlocProvider.of(context);
  GetConsultationModel? getConsultationModel;
  void getConsultations({required int ID_Profile}) {
    emit(Hospatelloading());
    DioHelper.getDataClub(
            endpoint: "allConsultationByUser/${ID_Profile}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString());
      getConsultationModel = GetConsultationModel.fromJson(value.data);
      emit(HospatelSeccessfluy());
    }).catchError((onError) {
      print(onError.toString());
      emit(HospatelError());
    });
  }

  void configurePusherConsultation() async {
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
      getConsultations(ID_Profile: CachShpreafapp.getdata(key: "ProfileID"));
      print(
          'Received event in customEventHandler with id: - ${event.toString()}');
    };
  }
}
