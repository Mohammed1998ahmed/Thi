import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';
import '../logic/cubit/reset_pass_word_cubit.dart';

class textFromFieldWidght extends StatelessWidget {
  const textFromFieldWidght({
    super.key,
    required this.cubit,
    required this.height,
  });

  final ResetPassWordCubit cubit;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        TextFieldWidght(
          context: context,
          hintText: "Email",
          controller: cubit.emailController,
          messageForm: "Pleas Enter Email",
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: height * 0.0150,
        ),
        TextFieldWidght(
          context: context,
          hintText: "Probe Code",
          controller: cubit.codeEmail,
          messageForm: "Pleas Enter Probe Code",
          keyboardType: TextInputType.phone,
        ),
        SizedBox(
          height: height * 0.0150,
        ),
        TextFieldWidght(
          context: context,
          hintText: "PassWord",
          controller: cubit.passWord,
          messageForm: "Pleas Enter Email",
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: height * 0.0150,
        ),
        TextFieldWidght(
          context: context,
          hintText: "Password_confirmation",
          controller: cubit.conf_passWord,
          messageForm: "Pleas Enter Password_confirmation",
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: height * 0.0150,
        ),
      ],
    );
  }
}
