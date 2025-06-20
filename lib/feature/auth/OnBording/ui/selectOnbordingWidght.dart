import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Login/login.dart';
import '../logic/bloc.dart';

Padding selectOnbordingWidght(BuildContext context, {required W1Cubitt cubit}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonStaic(
          onTap: () {
            if (cubit.currentPage < 2 && cubit.currentPage1 < 2) {
              cubit.controller.animateToPage(
                cubit.currentPage + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              cubit.controller1.animateToPage(
                cubit.currentPage1 + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              cubit.controller.animateToPage(
                0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              cubit.controller1.animateToPage(
                0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
            // يتم تنفيذ هذا الكود عند النقر على الزر
            print('تم النقر على الزر!');
          },
          widthContainer: MediaQuery.of(context).size.width * 0.30,
          heightContainer: 50.0,
          title: "Next",
          context: context,
        ),
        Spacer(),
        cubit.isbutton
            ? Container()
            : ElevatedButton(
                style: ButtonStyle(
                  // تغيير عرض الزر
                  minimumSize: MaterialStateProperty.all(Size(100, 50)),
                  // تغيير لون الزر
                  backgroundColor: MaterialStateProperty.all(Color3),
                  // تغيير تأثير الظل
                  elevation: MaterialStateProperty.all(10),
                  // تحكم بحواف الزر
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Color3),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => LoginW(),
                    ),
                  );
                },
                child: text(title: 'Skip', fontSize: 18, color: Colors.black)),
      ],
    ),
  );
}
