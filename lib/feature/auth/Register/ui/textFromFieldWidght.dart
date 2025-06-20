import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/register_cubit.dart';
import 'imageProfile.dart';

Padding textFromFieldWidght(RegisterCubit cubit, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: imageProfile(cubit),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
        Row(
          children: [
            TextFieldWidght(
              widthC: MediaQuery.of(context).size.width * 0.4,
              controller: cubit.nameController,
              context: context,
              hintText: "Name",
              messageForm: 'Please enter your Name',
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.019,
            ),
            TextFieldWidght(
              widthC: MediaQuery.of(context).size.width * 0.4,
              controller: cubit.lnameController,
              context: context,
              hintText: "Last Name",
              messageForm: 'Please enter your Last Name',
              keyboardType: TextInputType.name,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
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
        // TextFieldWidght(
        //   controller: _emailController,
        //   context: context,
        //   hintText: "Email",
        //   messageForm: 'Please enter your Email',
        //   keyboardType: TextInputType.emailAddress,
        // ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
        Row(
          children: [
            TextFieldWidght(
              widthC: MediaQuery.of(context).size.width * 0.4,
              controller: cubit.passwordController,
              context: context,
              hintText: "PassWord",
              messageForm: 'Please enter your PassWord',
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.019,
            ),
            TextFieldWidght(
              widthC: MediaQuery.of(context).size.width * 0.4,
              controller: cubit.conf_passwordController,
              context: context,
              hintText: "password_confirmation",
              messageForm: 'Please enter your password_confirmation',
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
        TextFieldWidght(
          controller: cubit.phoneController,
          context: context,
          hintText: "phone",
          messageForm: 'Please enter your phone',
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
        Row(
          children: [
            TextFieldWidght(
              widthC: MediaQuery.of(context).size.width * 0.4,
              controller: cubit.addressController,
              context: context,
              hintText: "address",
              messageForm: 'Please enter your address',
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.019,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.080,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color0,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: TextFormField(
                  controller: cubit.dateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Date';
                    }
                    // تحقق من صيغة تاريخ الميلاد باستخدام تعبير منتظم
                    final dateRegex = RegExp(r'^\d{4}-\d{1,2}-\d{1,2}$');
                    if (!dateRegex.hasMatch(value)) {
                      return 'Please enter a valid date in the format (yyyy-MM-dd).';
                    }
                    return null;
                  },
                  keyboardType: TextInputType
                      .datetime, // تغيير نوع لوحة المفاتيح إلى التاريخ والوقت
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontFamily: 'Caveat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color5,
                    ),
                    hintText:
                        "yyyy-MM-dd", // تغيير نص التلميح لصيغة تاريخ الميلاد
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
        text(
          title: "Gender",
          fontSize: 18,
          color: Color0,
          fontWeight: FontWeight.bold,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.70,
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                // أو Flexible
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Color0,
                  // tileColor: Colors.red,

                  title: text(
                    title: 'Male',
                    fontSize: 16,
                    color: Color4,
                    fontWeight: FontWeight.w600,
                  ),
                  value: 1,
                  groupValue: cubit.selectedValue,
                  onChanged: (int? value) {
                    cubit.chaingSelectValue(value!);
                    cubit.SelectGender("Male");
                    // setState(() {
                    //   selectedValue = value as int;
                    // });
                  },
                ),
              ),
              Container(
                width: 110,
                // أو Flexible
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Color0,
                  title: text(
                    title: 'Woman',
                    fontSize: 16,
                    color: Color4,
                    fontWeight: FontWeight.w600,
                  ),
                  value: 2,
                  // contentPadding: EdgeInsets.zero,
                  groupValue: cubit.selectedValue,
                  onChanged: (value) {
                    cubit.chaingSelectValue(value!);
                    cubit.SelectGender("Woman");
                    // setState(() {
                    //   selectedValue = value as int;
                    // });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
