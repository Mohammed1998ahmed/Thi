import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../data/Notifation.dart';

part 'notifation_state.dart';

class NotifationCubit extends Cubit<NotifationState> {
  NotifationCubit() : super(NotifationInitial());

  static NotifationCubit getObject(context) => BlocProvider.of(context);
  NotifationDataModel? notifationDataModel;
  void getNotifation() {
    emit(NotifationLoadingN());
    DioHelper.getDataClub(
            endpoint: "getNotification",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      notifationDataModel = NotifationDataModel.fromJson(value.data);
      emit(NotifationSecessfulyN());
    }).catchError((onError) {
      emit(NotifationError());
    });
  }

  void postTokenDevice({required String token}) {
    emit(NotifationLoadingT());
    FormData formData = FormData.fromMap({});
    DioHelper.postData("endpoint", data: formData).then((value) {
      emit(NotifationSecessfulyT());
    }).catchError((onError) {
      emit(NotifationErrorT());
    });
  }
}
