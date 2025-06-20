import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/EditProfile/logic/cubit/edit_profile_cubit.dart';
import 'package:thi/feature/profile/EditProfile/edit.dart';
import 'package:thi/feature/profile/data/getProfileModel.dart';
import 'package:thi/feature/profile/ui/profile2.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _HexagonButtonPageState();
  final String? image;
  final ProfileModel? profileModel;
  EditProfile({this.image, this.profileModel});
}

class _HexagonButtonPageState extends State<EditProfile> {
  int selectedValue = 1;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();

  // TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();
  // TextEditingController controllerDate = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  int? gender1;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = EditProfileCubit.geyObject(context);

          return Scaffold(
            body: Stack(children: [
              Image.asset(
                imageBackground,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color0,
                      size: 30,
                    ),
                  ),
                  title: Container(
                    width: 230,
                    alignment: Alignment.center,
                    child: text(
                        title: 'Edit Profile',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color0),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                HexagonLine(lineColor: Color0, size: 130),
                                Container(
                                  width: Width * 0.3,
                                  height: Height * 0.2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: Width * 0.3,
                                        child: HexagonImage(
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          selectedImage1: _selectedImage,
                                          imageProfile: widget.image,
                                          // حجم الشكل السداسي
                                          // imageUrl: "", // عنوان URL للصورة
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            _pickImage();
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color0,
                                            size: 35,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromRGBO(113, 104, 116, 0.8),
                        ),
                        SizedBox(
                          height: Height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFieldWidght(
                              widthC: MediaQuery.of(context).size.width * 0.4,
                              controller: controllerName,
                              context: context,
                              suffixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color0,
                              ),
                              hintText: widget
                                      .profileModel!.user!.profiles!.fName
                                      .toString() ??
                                  "Name",
                              messageForm: 'Enter your Name',
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              width: Width * 0.0150,
                            ),
                            TextFieldWidght(
                              widthC: MediaQuery.of(context).size.width * 0.4,
                              controller: controllerLastName,
                              context: context,
                              suffixIcon: Icon(
                                Icons.person_2_outlined,
                                color: Color0,
                              ),
                              hintText: widget
                                      .profileModel!.user!.profiles!.lName
                                      .toString() ??
                                  "Last Name",
                              messageForm: 'Enter your Last Name',
                              keyboardType: TextInputType.name,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        TextFieldWidght(
                          widthC: MediaQuery.of(context).size.width * 0.82,
                          controller: controllerPhone,
                          context: context,
                          suffixIcon: Icon(
                            Icons.phone_android,
                            color: Color0,
                          ),
                          hintText: "Mobile : 098787876",
                          messageForm: 'Enter your Mobile',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        TextFieldWidght(
                          widthC: MediaQuery.of(context).size.width * 0.82,
                          controller: controllerLocation,
                          context: context,
                          suffixIcon: Icon(
                            Icons.location_city,
                            color: Color0,
                          ),
                          hintText: "Address : " +
                                  widget.profileModel!.user!.profiles!.address
                                      .toString() ??
                              "",
                          messageForm: 'Enter your Address',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: Height * 0.02,
                        ),
                        Container(
                          width: Width * 0.8,
                          height: Height * 0.06,
                          alignment: Alignment.center,
                          child: text(
                              title:
                                  "Your email verification is still pending.Please verify your account. ",
                              textAlign: TextAlign.center,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        SizedBox(
                          height: Height * 0.05,
                        ),
                        state is EditProfileLoadingPost
                            ? SpinkitWave()
                            : ButtonStaic(
                                context: context,
                                title: "Update Profile",
                                onTap: () {
                                  if (keyForm.currentState!.validate()) {
                                    if (_selectedImage != null) {
                                      cubit.postEditProfile(
                                        context: context,
                                        selectedImage: _selectedImage,
                                        // gender: gender1,
                                        name: controllerName.text,
                                        lastName: controllerLastName.text,
                                        // email: controllerEmail.text,
                                        phone: controllerPhone.text,
                                        location: controllerLocation.text,
                                        // data: controllerDate.text
                                      );
                                      
                                      print("الحمد لله رب العالمين");
                                    }
                                  }
                                }),
                        SizedBox(
                          height: 34,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
