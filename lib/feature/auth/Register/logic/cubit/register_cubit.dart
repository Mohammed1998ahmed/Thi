import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../../verifaction/data/resendCode.dart';
import '../../../verifaction/verifaction.dart';
import '../../data/modelRegister.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit getObject(context) =>
      BlocProvider.of<RegisterCubit>(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  File? selectedImage;
  // ignore: unused_field
  TextEditingController passwordController = TextEditingController();
  TextEditingController conf_passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final String flag = '🇦🇪';
  final keyForm = GlobalKey<FormState>();

  final String callingCode = '+971';
  File? imageFile1;
  void imagepath(File imagePath) {
    this.imageFile1 = imagePath;
    emit(RegisterImagePath());
  }

  User1? user;
  void postReister(
      {required File imageFile,
      required String Email,
      required String Name,
      required String LName,
      required String PassWord,
      required String Conf_PassWord,
      required String Phone,
      required String address,
      required String gender,
      required String birth,
      required BuildContext context}) async {
    List<int> fileBytes = await imageFile.readAsBytes();

    FormData formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(fileBytes, filename: 'image.jpg'),
      "FName": Name,
      "LName": LName,
      "mobile": Phone,
      "email": Email,
      "password": PassWord,
      "password_confirmation": Conf_PassWord,
      "address": address,
      "gender": gender,
      "birth": birth,
      "type": "profile",
    });
    DioHelper.postData(
      "register",
      data: formData,
    ).then((value) {
      user = User1.fromJson(value.data);

      Fluttertoast.showToast(
          msg: user!.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      // CachShpreafapp.sevedata(key: "tokenProfile", value: user!.data!.token);
      chingLoading(false);
      if (user!.status == true) {
        CachShpreafapp.sevedata(key: "tokenProfile", value: user!.data!.token!);
        CachShpreafapp.sevedata(key: "UserID", value: user!.data!.user!.id!);
        CachShpreafapp.sevedata(
            key: "FName", value: user!.data!.profile!.fName);
        CachShpreafapp.sevedata(
            key: "LName", value: user!.data!.profile!.lName);
        CachShpreafapp.sevedata(
            key: "ImageProfile", value: user!.data!.profile!.profile);

        CachShpreafapp.sevedata(
            key: "ProfileID", value: user!.data!.profile!.id!);
        postVerfitionCode(email: Email);
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ForgotPasswordVerificationPage(
              email: Email,
            ),
          ),
        );
        emit(RegisterSeccsfully());
      }
    }).catchError((onError) {
      print(onError.toString());
      Fluttertoast.showToast(
          msg: user!.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      chingLoading(false);
      emit(RegisterError());
    });
  }

  VerfictionModel? verficitionModel;
  void postVerfitionCode({required String email}) {
    emit(RegisterLoadingVerfetion());
    FormData formData = FormData.fromMap({
      "email": email,
    });
    DioHelper.postData("send-verification-email", data: formData).then((value) {
      verficitionModel = VerfictionModel.fromJson(value.data);
      if (verficitionModel!.status == true) {
        Fluttertoast.showToast(
            msg: verficitionModel!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(RegisterSeccsfullyVerfetion());
      }
    }).catchError((onError) {
      if (verficitionModel!.status == false) {
        Fluttertoast.showToast(
            msg: verficitionModel!.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(RegisterErrorVerfetion());
      }
    });
  }

  bool isload = false;
  void chingLoading(bool isloading) {
    this.isload = isloading;
    emit(RegisterChangLoading());
  }

  int selectedValue = 1;
  void chaingSelectValue(int selectindex) {
    this.selectedValue = selectindex;
    emit(RegisterSelectedValue());
  }

  String selectGender = "Male";
  void SelectGender(String gender) {
    this.selectGender = gender;
    emit(RegisterSelectGender());
  }
}
