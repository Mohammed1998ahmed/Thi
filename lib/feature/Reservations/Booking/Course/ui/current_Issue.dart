import 'package:flutter/material.dart';

import '../../../../../core/component/conset/Const.dart';
import '../../../../../core/widght/Widght.dart';

Padding current_Issue() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: text(
              title: "Current Issue",
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            child: text(
              title: '\u2192',
              textAlign: TextAlign.center,
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            child: text(
              title: "Available number",
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  );
}
