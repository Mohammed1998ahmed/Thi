import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Auction/DetlisHours/data/RemoveFavoriteModel.dart';
import '../../../../../Auction/DetlisHours/data/addFavoriteModel.dart';
import '../../../../../../core/NetWork/dioHelper.dart';
import '../../../../../../core/sharePreferinces/shardprefericences.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  static DetailsCubit getObject(context) => BlocProvider.of(context);

  /////////////////////favorate

  AddFavoriteModel? addFavoriteModel;
  void postFavoratie({required int idActions, required int idUser}) {
    emit(DetailsfavorateLoading());
    DioHelper.postData("addAuctionToFavorites",
            data: {"user_id": idUser, "auction_id": idActions},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      addFavoriteModel = AddFavoriteModel.fromJson(value.data);
      // chaingFavorite(true);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${idActions}",
          value: true);
      print("objectfffffffffffffffffffffff");
      emit(DetailsfavorateSeccessfluy());
    }).catchError((onError) {
      emit(DetailsfavorateError());
    });
  }

  RemoveFavoriteModel? removeFavoriteModel;

  void postRemoveFavoratie(
      {required int idActions,
      required int idUser,
      required BuildContext context}) {
    emit(DetailsRemovefavorateLoading());
    DioHelper.postData("removeAuctionFromFavorites",
            data: {"user_id": idUser, "auction_id": idActions},
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      removeFavoriteModel = RemoveFavoriteModel.fromJson(value.data);
      // chaingFavorite(false);
      CachShpreafapp.sevedata(
          key:
              "boolfavoratieActions${CachShpreafapp.getdata(key: "UserID")}${idActions}",
          value: false);

      print("objectfffffffffffffffffffffffrrrrrrrrrrrrrrrrrrrr");
      Navigator.pop(context);
      emit(DetailsRemovefavorateseccessfluy());
    }).catchError((onError) {
      emit(DetailsRemovefavorateError());
    });
  }
}
