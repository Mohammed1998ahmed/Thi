// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/auth/ChangPassword/logic/cubit/chaing_pass_word_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

class ChangPassword extends StatelessWidget {
  ChangPassword({Key? key}) : super(key: key);
  final String flag = '🇦🇪';
  final String callingCode = '+971';
  final keyForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ChaingPassWordCubit();
      },
      child: BlocConsumer<ChaingPassWordCubit, ChaingPassWordState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ChaingPassWordCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return SafeArea(
            child: Container(
              width: width,
              height: height,
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
                      color: Colors.black,
                    ),
                  ),
                ),
                body: Container(
                  width: width,
                  height: height,
                  child: SingleChildScrollView(
                    child: Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          SafeArea(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Container(
                                        width: width * 0.90,
                                        height: height * 0.28,
                                        child: Image.asset(
                                          'assets/images/Forgot password-cuate.png',
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        text(
                                            title: "Change password",
                                            color: Color.fromRGBO(35, 0, 44, 1),
                                            fontSize: 28,
                                            fontWeight: FontWeight.w700),
                                        Spacer()
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFieldWidght(
                                      context: context,
                                      hintText: "Email",
                                      controller: emailController,
                                      messageForm: "Pleas Enter Email",
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(
                                      height: height * 0.150,
                                    ),
                                    cubit.isLoad
                                        ? SpinkitWave()
                                        : ButtonStaic(
                                            onTap: () {
                                              if (keyForm.currentState!
                                                  .validate()) {
                                                cubit.chaingLoaging(true);
                                                cubit.postEmail(
                                                    Email: emailController.text,
                                                    context: context);

                                                print('Login successful');
                                              }

                                              print('تم النقر على الزر!');
                                            },
                                            title: "Send Verification Code",
                                            context: context),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
