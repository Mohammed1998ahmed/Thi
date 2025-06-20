import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/core/NetWork/dioHelper.dart';

part 'config_notifaction_state.dart';

class ConfigNotifactionCubit extends Cubit<ConfigNotifactionState> {
  ConfigNotifactionCubit() : super(ConfigNotifactionInitial());

  static ConfigNotifactionCubit getObject(context) => BlocProvider.of(context);

  void postTokenDevice({required String token}) {
    emit(ConfigNotifactionTokenLoading());
    FormData data = FormData.fromMap({});
    DioHelper.postData("endpoint", data: data).then((value) {
      emit(ConfigNotifactionTokenSessecfluy());
    }).catchError((onError) {
      emit(ConfigNotifactionTokenError());
    });
  }
}
