import 'package:flutter/material.dart';

Column images(
  BuildContext context, {
  required String name,
}) {
  return Column(
    children: [
      Container(
        child: Image.asset(
          name,
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.contain,
        ),
      ),
    ],
  );
}
