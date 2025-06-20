import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/CoursBooking.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/DleteBooking.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/datailsBooking.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/deletCours.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/deleteOneTime.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/getListCoursBooking.dart';
import 'package:thi/feature/profile/BookingandAppointment/data/listBooking.dart';
import 'package:thi/feature/profile/BookingandAppointment/selectTepyBooking.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  static BookingCubit getObject(context) => BlocProvider.of(context);
  GetBookingListModel? getBookingListModel;

  void getDataListBooking() {
    emit(BookingLoading());
    DioHelper.getDataClub(
            endpoint:
                "getAllBookingByUser/${CachShpreafapp.getdata(key: "UserID")}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getBookingListModel = GetBookingListModel.fromJson(value.data);

      emit(BookingSueccfuly());
    }).catchError((onError) {
      emit(BookingError());
    });
  }

  int? islength;
  void isCachkLength(int length) {
    this.islength = length;
    emit(BookingCackLength());
  }

  DatailsBooking? datailsBooking;

  void getDataDatailsBooking({required int idBooking}) {
    emit(BookingDatailsLoading());
    DioHelper.getDataClub(
            endpoint: "getBookingDescription/${idBooking}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      datailsBooking = DatailsBooking.fromJson(value.data);

      emit(BookingDatailsSueccfuly(datailsBooking: datailsBooking));
    }).catchError((onError) {
      emit(BookingDatailsError());
    });
  }

  DeleteBooking? deleteBooking;

  void getDataDeleteBooking(
      {required int idBooking, required BuildContext context}) {
    emit(BookingDeleteLoading());
    FormData formData = FormData.fromMap({
      "booking_id": idBooking,
      "user_id": CachShpreafapp.getdata(key: "UserID"),
    });
    DioHelper.postData("deleteBooking",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deleteBooking = DeleteBooking.fromJson(value.data);

      getDataListBooking();
      if (deleteBooking!.status == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SelectTypeBooking(),
          ),
        );
      }
      // Navigator.pop(context);
      emit(BookingDeleteSueccfuly());
    }).catchError((onError) {
      emit(BookingDeleteError());
    });
  }

  DeleteOneTime? deleteOneTime;

  void postDataDeleteOneTime(
      {required int idBooking,
      required int trainerTime_id,
      required BuildContext context}) {
    emit(BookingDeleteOneTimeLoading());
    FormData formData = FormData.fromMap({
      "trainerTime_id": trainerTime_id,
      "user_id": CachShpreafapp.getdata(key: "UserID"),
    });
    DioHelper.postData("cancelBookingTime",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deleteOneTime = DeleteOneTime.fromJson(value.data);
      if (this.islength == 1) {
        emit(BookingDeleteOneTimePOP());
      } else {
        getDataDatailsBooking(idBooking: idBooking);
      }
      Navigator.pop(context);
      emit(BookingDeleteOneTimeSueccfuly(deleteOneTime: deleteOneTime));
    }).catchError((onError) {
      emit(BookingDeleteOneTimeError());
    });
  }

  ////////////////////////GetCoursBooking
  GetCoursClubs? getCoursClubs;
  void getDataListCoursBooking() {
    emit(BookingCoursClubsLoading());
    DioHelper.getDataClub(
            endpoint: "Reserved_User_clubs",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      getCoursClubs = GetCoursClubs.fromJson(value.data);

      emit(BookingCoursClubsSueccfuly());
    }).catchError((onError) {
      emit(BookingCoursClubsError());
    });
  }

  GetListCoursBooking? getListCoursBooking;
  void getDatagetListCoursBooking({required int id_Club}) {
    emit(BookingListBookingCoursClubsLoading());
    DioHelper.getDataClub(
            endpoint: "UserReservation/${id_Club}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.toString() +
          "******************************&&&&&&&&&&&&&&&&&^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^%%%%%%%%%%%%%");
      getListCoursBooking = GetListCoursBooking.fromJson(value.data);

      emit(BookingListBookingCoursClubsSueccfuly());
    }).catchError((onError) {
      print(onError.toString() + "xccvcvcvvc");
      emit(BookingListBookingCoursClubsError());
    });
  }

  DeletCoursBooking? deletCoursBooking;
  void DeletDatagetListCoursBooking(
      {required BuildContext context,
      required int id_Cours,
      required int id_Club}) {
    emit(BookingDeleteCoursClubsLoading());

    print(id_Cours.toString() +
        "IIIIIIIIIIIIIIIIIIIIIIIIIUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
    DioHelper.deleteData(
            endpoint: "cancelReservation/${id_Cours}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      deletCoursBooking = DeletCoursBooking.fromJson(value.data);
      getDatagetListCoursBooking(id_Club: id_Club);
      Fluttertoast.showToast(
          msg: deletCoursBooking!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      emit(BookingDeleteCoursClubsSueccfuly());
    }).catchError((onError) {
      emit(BookingDeleteCoursClubsError());
    });
  }
}
