import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

GestureDetector ButtonBookandDirectionandShare(
    {required BuildContext context,
    void Function()? onTap,
    IconData? icon,
    required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white54,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Color0,
            child: Icon(
              icon ?? Icons.book,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        text(
            title: title,
            color: Color.fromRGBO(0, 0, 0, 0.54),
            fontSize: 13,
            fontWeight: FontWeight.w400)
      ],
    ),
  );
}
