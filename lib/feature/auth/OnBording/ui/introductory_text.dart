import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

SingleChildScrollView introductory_text({
  String? title,
  String? subtitle,
}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(
                title: title ?? "Find and Book Services",
                color: Color0,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 6,
              ),
              text(
                title: subtitle ?? "Find, book, auctions and horses.",
                color: Color2,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
