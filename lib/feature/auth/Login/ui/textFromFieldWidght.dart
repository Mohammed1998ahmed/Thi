import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/login_cubit.dart';

class textfromfiledWidght extends StatelessWidget {
  const textfromfiledWidght({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.080,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color0,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: cubit.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // تحقق من صيغة البريد الإلكتروني باستخدام تعبير منتظم
                final emailRegex =
                    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                if (!emailRegex.hasMatch(value)) {
                  return "Please enter a valid email address.";
                }
                return null;
              },

              keyboardType: TextInputType
                  .emailAddress, // تغيير نوع لوحة المفاتيح إلى البريد الإلكتروني
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.email),
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color5,
                ),
                hintText:
                    "example@example.com", // تغيير نص التلميح لصيغة البريد الإلكتروني
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.030,
        ),
        TextFieldWidght(
            controller: cubit.passwordController,
            messageForm: 'Please enter your password',
            keyboardType: TextInputType.emailAddress,
            obscureText: cubit.isloadObserivice,
            suffixIcon: IconButton(
                onPressed: () {
                  cubit.chingLoadingObserivice();
                },
                icon: cubit.isloadObserivice
                    ? Icon(Icons.remove_red_eye_sharp)
                    : Icon(Icons.password_outlined)),
            hintText: "PassWord",
            context: context),
      ],
    );
  }
}
