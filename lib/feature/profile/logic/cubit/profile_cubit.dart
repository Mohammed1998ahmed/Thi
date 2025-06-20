import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/SplashScreen/SplashScreen.dart';
import 'package:thi/feature/profile/data/LogoutModel.dart';
import 'package:thi/feature/profile/data/getProfileModel.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../data/modelProfile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit getObject(context) => BlocProvider.of(context);
  ProfileModel? profileModel;
  final userResponseController = StreamController<UserResponse>();

// في الكود الخاص بـ cubit
  Stream<UserResponse> get userResponseStream => userResponseController.stream;
  void getprofile() {
    emit(ProfileLoadingProfile());

    DioHelper.getDataProfile(
            "getProfile/${CachShpreafapp.getdata(key: "UserID")}",
            CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      profileModel = ProfileModel.fromJson(value.data);

      emit(ProfileSuecussfulyProfile());
    }).catchError((onError) {
      print(onError.toString());
      emit(ProfileErorrProfile());
    });
  }

  LogoutModel? logoutModel;
  void logOut(BuildContext context) {
    emit(ProfileLogoutLoading());
    DioHelper.postData("logout",
            data: null, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      logoutModel = LogoutModel.fromJson(value.data);
      if (logoutModel!.status == true) {
        CachShpreafapp.remove(key: "tokenProfile");

        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SplashScreen(),
          ),
        );
        // CachShpreafapp.remove(key: "tokenPrfile");
        // print(object)
      }
      emit(ProfileLogoutSceccfuly());
    }).catchError((onError) {
      emit(ProfileLogoutError());
    });
  }
}
