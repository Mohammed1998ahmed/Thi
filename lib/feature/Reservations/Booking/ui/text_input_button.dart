import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';

Row text_input_button({String? Data}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      text(
        title: Data == null ? "12 12 2024" : Data.toString(),
        textAlign: TextAlign.center,
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      Spacer(),
      IconButton(
        icon: Icon(
          Icons.date_range,
          color: Colors.white,
          size: 35,
        ),
        onPressed: () {},
      ),
    ],
  );
}
