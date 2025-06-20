import 'package:flutter/material.dart';

import '../../../../../core/component/conset/Const.dart';
import '../../../../../core/widght/Widght.dart';

Row appBar_details_cources(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color0,
            )),
      ),
      Center(
        child: text(
            title: 'Booking Details',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color0),
      ),
    ],
  );
}
