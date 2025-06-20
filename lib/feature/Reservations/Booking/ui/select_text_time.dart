import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';

Container select_text_time() {
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Text(
      'Select your date',
      style: TextStyle(
        color: Color0,
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    ),
  );
}
