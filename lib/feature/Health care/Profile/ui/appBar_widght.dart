import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

AppBar appBar_widght(BuildContext context) {
  return AppBar(
    backgroundColor: Color0,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Color4,
        size: 30,
      ),
    ),
    title: Center(
      child: text(
          title: "Profile",
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color4),
    ),
    centerTitle: true,
    actions: [
      SizedBox(
        width: 50,
      )
    ],
  );
}
