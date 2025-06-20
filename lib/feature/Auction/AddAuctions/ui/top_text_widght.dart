import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

Column top_text_widght(BuildContext context) {
  return Column(
    children: [
      text(
          title: "Add Auctions",
          color: Color6,
          fontSize: 28,
          fontWeight: FontWeight.w700),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: text(
            title: "You are welcome",
            textAlign: TextAlign.center,
            color: Color2,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
    ],
  );
}
