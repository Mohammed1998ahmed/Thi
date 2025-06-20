import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';

Padding ShimerWidghtt(double width, double height) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: ShimerWidght(
        width: width * 0.2,
        height: height * 0.3,
        reduis: 10,
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 30, bottom: 6),
        child: ShimerWidght(
          width: width * 0.02,
          height: height * 0.03,
        ),
      ),
      trailing: ShimerWidght(
        width: width * 0.2,
        height: height * 0.05,
        reduis: 30,
      ),
    ),
  );
}
