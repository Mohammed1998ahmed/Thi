import 'package:flutter/material.dart';

import '../../../../../core/component/conset/Const.dart';
import '../../../../../core/widght/Widght.dart';

Row payment_Method_text() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    text(
      title: 'Payment Method',
      fontSize: 19,
      color: Color0,
    ),
    text(title: '+ Add a new card', color: Colors.black),
  ]);
}
