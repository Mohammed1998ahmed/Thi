import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/Reservations/Home/main_screen.dart';
import 'package:thi/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:thi/feature/profile/data/editProfile.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit geyObject(context) => BlocProvider.of(context);
  UpdataModel? updataModel;
  ProfileCubit profileCubit = ProfileCubit();
  void postEditProfile(
      {File? selectedImage,
      // int? gender,
      required String name,
      required String lastName,

      // required String email,
      required String phone,
      // required String data,
      required String location,
      required BuildContext context}) async {
    emit(EditProfileLoadingPost());
    List<int> fileBytes = await selectedImage!.readAsBytes();

    FormData formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(fileBytes, filename: 'image.jpg'),
      "FName": name,
      "LName": lastName,
      "mobile": phone,
      "address": location,
      "type": "profile",
    });

    print(CachShpreafapp.getdata(key: "tokenProfile").toString());
    print(name + lastName + phone + location + fileBytes.toString());
    DioHelper.postData("update",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(CachShpreafapp.getdata(key: "tokenProfile").toString());

      // print(value.data.toString());
      updataModel = UpdataModel.fromJson(value.data);

      if (updataModel!.status!) {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => MainScreen(),
          ),
        );
      }
      Fluttertoast.showToast(
          msg: updataModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(EditProfileSueccufilyPost());
      // getprofile();
      profileCubit.getprofile();
      // getdataEidtProfile();
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: updataModel!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(EditProfileErrorPost());
      print(onError.toString());
    });
  }

  void getprofile() {
    emit(EditProfileLoadingGet());

    DioHelper.getDataProfile(
            "profile", CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString());

      emit(EditProfileSueccufulyGet());
    }).catchError((onError) {
      print(onError.toString());
      emit(EditProfileErrorGet());
    });
  }
}
