import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thi/feature/Auction/AddAuctions/data/addAuctions.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

part 'add_auctions_state.dart';

class AddAuctionsCubit extends Cubit<AddAuctionsState> {
  AddAuctionsCubit() : super(AddAuctionsInitial());

  static AddAuctionsCubit getObject(context) => BlocProvider.of(context);
  TextEditingController categoryController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController colorController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController conf_passwordController = TextEditingController();

  TextEditingController initaPriceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  final String flag = '🇦🇪';

  final keyForm = GlobalKey<FormState>();

  final String callingCode = '+971';
  String? selectedColor;
  final List<String> horseColors = [
    'Bay',
    'Black',
    'Brown',
    'Chestnut',
    'Gray',
    'Palomino',
    'Roan',
    'Buckskin',
    'Dun',
    'Appaloosa',
    'Paint',
    'Pinto'
  ];
  void chaingSelectColor({required String color}) {
    this.selectedColor = color;
    emit(AddAuctionsSelectColor());
  }

  String? Data;
  String? Data1;
  String? BirthData;
  int selectedValue = 1;
  void chaingSelectValue(int selectindex) {
    this.selectedValue = selectindex;
    emit(AddAuctionsSelectValue());
  }

  String selectGender = "Male";
  void SelectGender(String gender) {
    this.selectGender = gender;
    emit(AddAuctionsSelectGender());
  }

  AddAuctions? addAuctions;
  void postAddAuctions({
    required BuildContext context,
    required List<XFile> selectedImages,
    required String name,
    required String color,
    required String Category,
    required String Data,
    required String Data1,
    required String initaPrice,
    required String description,
    required String addriess,
    required String berathData,
    required String gender,
    required String controller,
  }) async {
    List<MultipartFile> imageFiles = [];

    for (XFile image in selectedImages) {
      File file = File(image.path);
      String fileName = image.path.split('/').last;
      MultipartFile multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      );
      imageFiles.add(multipartFile);
    }

// for (int i = 0; i < imageFiles.length; i++) 'images[$i]': imageFiles[i],

    FormData formData = FormData.fromMap({
      for (int i = 0; i < imageFiles.length; i++) 'images[$i]': imageFiles[i],
      // 'images': imageFiles,
      'video': await MultipartFile.fromFileSync(controller),
      'name': name,
      'address': addriess,
      'category': Category,
      'color': color,
      'gender': gender,
      'birth': berathData,
      'initialPrice': initaPrice,
      'description': description,
      'begin': Data,
      'end': Data1,
      'user_id': CachShpreafapp.getdata(key: "UserID"),
    });

    emit(AddAuctionsLoading());
    DioHelper.postData("AddAuction",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString() + "PPPPPPPPPPPPPPPP");
      addAuctions = AddAuctions.fromJson(value.data);

      Fluttertoast.showToast(
          msg: addAuctions!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (addAuctions!.status == true) {
        Navigator.pop(context);
      }

      emit(AddAuctionsSeccecfluy());
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: addAuctions!.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(AddAuctionsError());
    });
  }
}
