import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/auth/Login/login.dart';
import 'package:thi/feature/auth/Register/logic/cubit/register_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'ui/ImageRegister.dart';
import 'ui/textFromFieldWidght.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  // ignore: unused_field

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegisterCubit();
      },
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = RegisterCubit.getObject(context);
          // ignore: unused_local_variable
          File? imageFile;
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
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
                    color: Color2,
                  ),
                ),
              ),
              body: Container(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.keyForm,
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ImageRegister(),
                                text(
                                    title: "Register",
                                    color: Color6,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: text(
                                      title: "You are welcome",
                                      textAlign: TextAlign.center,
                                      color: Color2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                textFromFieldWidght(cubit, context),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.0010,
                                ),
                                cubit.isload
                                    ? SpinkitWave()
                                    : ButtonStaic(
                                        context: context,
                                        onTap: () {
                                          if (cubit.keyForm.currentState!
                                              .validate()) {
                                            if (cubit.selectedImage != null) {
                                              cubit.chingLoading(true);
                                              cubit.postReister(
                                                  imageFile:
                                                      cubit.selectedImage!,
                                                  LName: cubit
                                                      .lnameController.text,
                                                  address: cubit
                                                      .addressController.text,
                                                  birth:
                                                      cubit.dateController.text,
                                                  gender: cubit.selectGender,
                                                  Email: cubit
                                                      .emailController.text,
                                                  Name:
                                                      cubit.nameController.text,
                                                  PassWord: cubit
                                                      .passwordController.text,
                                                  Conf_PassWord: cubit
                                                      .conf_passwordController
                                                      .text,
                                                  Phone: cubit
                                                      .phoneController.text,
                                                  context: context);
                                            }
                                          }

                                          print('تم النقر على الزر!');
                                        },
                                        title: "Next",
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      text(
                                        title: "Already have an account?",
                                        color: Color2,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        LoginW(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(71, 181, 255,
                                                      1), // اللون الأصلي
                                                  Color.fromRGBO(199, 255, 255,
                                                      1), // اللون المتناسق
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Center(
                                              child: text(
                                                title: "Sign in",
                                                color: Color3,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
