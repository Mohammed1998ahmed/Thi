import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/Home/main_screen.dart';

import 'package:thi/feature/auth/Login/logic/cubit/login_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/donthaveAnAccount.dart';
import 'ui/forgotyourpassword.dart';
import 'ui/imageLogin.dart';
import 'ui/textFromFieldWidght.dart';

class LoginW extends StatelessWidget {
  LoginW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (State is LoginLoading) {
            LoginCubit.getObject(context).chingLoading(true);
          }
          if (state is LoginSusccfuly) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => MainScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.getObject(context);
          return Scaffold(
            body: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        ImageLogin(),
                        text(
                          title: "Sign In",
                          color: Color2,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: height * 0.006,
                        ),
                        text(
                          title: "Horse Auctions, Booking & Healthcare",
                          color: Color2,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                        Row(
                          children: [
                            text(
                              title: "You are welcome",
                              color: Color2,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            Spacer()
                          ],
                        ),
                        SizedBox(
                          height: height * 0.004,
                        ),
                        textfromfiledWidght(cubit: cubit),
                        Forgotyourpassword(),
                        cubit.isload
                            ? SpinkitWave()
                            : ButtonStaic(
                                onTap: () {
                                  // يتم تنفيذ هذا الكود عند النقر على الزر
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.chingLoading(true);
                                    cubit.postLogin(
                                        Email: cubit.emailController.text,
                                        PassWord: cubit.passwordController.text,
                                        context: context);

                                    // إذا كانت جميع الحقول صحيحة
                                    // يمكنك تنفيذ الإجراء المطلوب هنا، مثل تسجيل الدخول
                                  }
                                },
                                title: "Sign In",
                                context: context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        DonthaveAnAccount(),
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
