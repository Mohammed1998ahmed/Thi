import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

AppBar appBar_Booking_old() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back,
        color: Color0,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: text(
      title: 'Book Appointment',
      color: Color0,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    toolbarHeight: 30,
  );
}
