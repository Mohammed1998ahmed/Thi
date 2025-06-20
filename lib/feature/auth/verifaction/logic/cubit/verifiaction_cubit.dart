import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/Reservations/Home/main_screen.dart';

import '../../data/model.dart';
import '../../data/resendCode.dart';

part 'verifiaction_state.dart';

class VerifiactionCubit extends Cubit<VerifiactionState> {
  VerifiactionCubit() : super(VerifiactionInitial());
  static VerifiactionCubit getObject(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  List<String> otpValues = ['', '', '', '', ''];
  bool iscolor = false;
  int animationDuratio = 10;
  // ignore: unused_field
  bool _pinSuccess = false;

  Verfy? verfy;
  void postVerifiaction(
      {required BuildContext context,
      required String Email,
      required String Verifiaction}) {
    emit(VerifiactionLoading());
    FormData formData =
        FormData.fromMap({"email": Email, "verificationCode": Verifiaction});
    DioHelper.postData("verify", data: formData).then((value) {
      verfy = Verfy.fromJson(value.data);

      chaingLoading(false);
      // CachShpreafapp.sevedata(key: "boolfavoratie", value: false);
      if (verfy!.status == true) {
        Fluttertoast.showToast(
            msg: verfy!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 8,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => MainScreen(),
          ),
        );
        emit(VerifiactionSececcfully());
      }
      if (verfy!.status == false) {
        Fluttertoast.showToast(
            msg: verfy!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).catchError((onError) {
      emit(VerifiactionError());
    });
  }

  bool isload = false;
  void chaingLoading(bool loading) {
    this.isload = loading;
    emit(VerifiactionChaingLoading());
  }

  final animateTimerController = AnimateTimerController();
  void TimeValue() {
    animateTimerController.restart();
    emit(VerifiactionTimeValue());
  }

  VerfictionModel? verficitionModel;
  void postVerfitionCode({required String email}) {
    emit(VerifiactionResendCodeLoading());
    FormData formData = FormData.fromMap({
      "email": email,
    });
    DioHelper.postData("send-verification-email", data: formData).then((value) {
      verficitionModel = VerfictionModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: verficitionModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(VerifiactionResendCodeSececcfully());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: verficitionModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(VerifiactionResendCodeError());
    });
  }
}
