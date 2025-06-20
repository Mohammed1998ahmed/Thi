import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../data/modelLogin.dart';
import '../../data/postnotifationModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit getObject(context) => BlocProvider.of(context);
  String? selectedCountryCode;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  PostNotifation? postNotifation;
  void postTokenDevice() {
    emit(NotifationLoadingT());
    String token = CachShpreafapp.getdata(key: "tokenDevice");
    FormData formData = FormData.fromMap(
        {"user_id": CachShpreafapp.getdata(key: "UserID"), "token": token});
    DioHelper.postData("addToken",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      postNotifation = PostNotifation.fromJson(value.data);
      emit(NotifationSecessfulyT());
    }).catchError((onError) {
      emit(NotifationErrorT());
    });
  }

  LoginModel? loginModel;
  void postLogin(
      {required String Email,
      required String PassWord,
      required BuildContext context}) {
    print(Email + PassWord);
    emit(LoginLoading());
    FormData formData = FormData.fromMap({
      "email": Email,
      "password": PassWord,
    });
    DioHelper.postData("login", data: formData).then((value) {
      print("login Sccfully");
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      CachShpreafapp.sevedata(
          key: "tokenProfile", value: loginModel!.data!.token!);
      CachShpreafapp.sevedata(
          key: "UserID", value: loginModel!.data!.user!.id!);
      CachShpreafapp.sevedata(
          key: "FName", value: loginModel!.data!.user!.profiles!.fName!);
      CachShpreafapp.sevedata(
          key: "LName", value: loginModel!.data!.user!.profiles!.lName!);
      CachShpreafapp.sevedata(
          key: "ImageProfile",
          value: loginModel!.data!.user!.profiles!.profile!);
      CachShpreafapp.sevedata(
          key: "ProfileID", value: loginModel!.data!.user!.profiles!.id!);
      print(CachShpreafapp.getdata(key: "tokenProfile").toString());

      Fluttertoast.showToast(
          msg: loginModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      postTokenDevice();
      chingLoading(false);
      emit(LoginSusccfuly());
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: loginModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      chingLoading(false);
      emit(LoginError());
    });
  }

  bool isload = false;
  void chingLoading(bool isloading) {
    this.isload = isloading;
    emit(LoginChangLoading());
  }

  bool isloadObserivice = true;
  void chingLoadingObserivice() {
    this.isloadObserivice = !this.isloadObserivice;
    emit(LoginChangLoading());
  }
}
