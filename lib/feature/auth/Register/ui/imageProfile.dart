import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/component/conset/Const.dart';
import '../logic/cubit/register_cubit.dart';

Stack imageProfile(RegisterCubit cubit) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      CircleAvatar(
        radius: 70.0,
        backgroundColor: Color.fromRGBO(108, 196, 255, 0.773),
        backgroundImage:
            cubit.imageFile1 != null ? FileImage(cubit.imageFile1!) : null,
      ),
      GestureDetector(
        onTap: () async {
          final picker = ImagePicker();
          final pickedImage =
              await picker.pickImage(source: ImageSource.gallery);

          if (pickedImage != null) {
            cubit.selectedImage = File(pickedImage.path);
            cubit.imagepath(cubit.selectedImage!);
          }
        },
        child: CircleAvatar(
          radius: 20.0,
          backgroundColor: Color0,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    ],
  );
}
