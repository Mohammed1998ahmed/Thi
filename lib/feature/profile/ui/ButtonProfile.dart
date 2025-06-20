import 'package:flutter/material.dart';

import '../../../core/component/conset/Const.dart';
import '../../../core/widght/Widght.dart';

Padding ButtonProfile(
    {required double Height,
    required double Width,
    required BuildContext context,
    IconData? icon,
    required String title,
    required void Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(left: 17.5, right: 10),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(71, 181, 255, 0.596)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: Height * 0.06,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: Width * 0.03,
          ),
          text(
              // "Booking Order & Appointments"
              title: title,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          Spacer(),
          IconButton(
              onPressed: onPressed,
              icon: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color0,
                  size: 20,
                ),
              ))
        ],
      ),
    ),
  );
}
