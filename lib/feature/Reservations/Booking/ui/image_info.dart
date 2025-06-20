import 'package:flutter/material.dart';

Center image_info(double Width, double Height) {
  return Center(
    child: Container(
      width: Width * 0.7,
      height: Height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Service 24_7-amico.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
