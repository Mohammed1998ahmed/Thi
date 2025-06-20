import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import '../../data/ProfileAuctions.dart';
import '../../data/winAuctionModel.dart';

part 'auction_user_state.dart';

class AuctionUserCubit extends Cubit<AuctionUserState> {
  AuctionUserCubit() : super(AuctionUserInitial());
  static AuctionUserCubit getObject(context) => BlocProvider.of(context);
  ProfileAuctionModel? profileAuctionModel;
  void geActionsByUser() {
    emit(AuctionUserLoading());
    DioHelper.getDataClub(
            endpoint: "Auctions_that_A_User_Participates_in",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      profileAuctionModel = ProfileAuctionModel.fromJson(value.data);
      for (var i = 0; i < profileAuctionModel!.auctions!.length; i++) {
        CachShpreafapp.getdata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${profileAuctionModel!.auctions![i].horses!.auctionId}") ??
            CachShpreafapp.sevedata(
                key:
                    "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${profileAuctionModel!.auctions![i].horses!.auctionId}",
                value: false);
      }
      emit(AuctionUserSeccessfluy());
    }).catchError((onError) {
      print(onError.toString() + "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      emit(AuctionUserError());
    });
  }

  WinAcutionModel? winAcutionModel;
  void geActionsByUserWin() {
    emit(AuctionUserWinLoading());
    DioHelper.getDataClub(
            endpoint: "Auctions_that_A_User_WIN",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      winAcutionModel = WinAcutionModel.fromJson(value.data);
      // for (var i = 0; i < profileAuctionModel!.auctions!.length; i++) {
      //   CachShpreafapp.getdata(
      //           key:
      //               "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${profileAuctionModel!.auctions![i].horses!.auctionId}") ??
      //       CachShpreafapp.sevedata(
      //           key:
      //               "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${profileAuctionModel!.auctions![i].horses!.auctionId}",
      //           value: false);
      // }
      emit(AuctionUserWinSeccessfluy());
    }).catchError((onError) {
      print(onError.toString() + "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
      emit(AuctionUserWinError());
    });
  }
}
