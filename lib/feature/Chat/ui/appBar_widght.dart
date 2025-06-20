import 'package:flutter/material.dart';

import '../../../core/component/conset/Const.dart';
import '../../../core/widght/Widght.dart';

AppBar appBar_widght(BuildContext context, {required String FNameTrinner}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
      ),
    ),
    title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // CircleAvatar(
      //   radius: 5,
      //   backgroundColor: Colors.green,
      // ),
      // SizedBox(
      //   width: 10,
      // ),
      Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: text(
          title: "${FNameTrinner}",
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color0,
        ),
      )
    ]),
    actions: [
      SizedBox(
        width: 40,
      )
    ],
  );
}
