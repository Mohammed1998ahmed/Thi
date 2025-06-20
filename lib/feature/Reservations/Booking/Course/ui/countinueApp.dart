import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/component/conset/Const.dart';
import '../../../../../core/widght/Widght.dart';

countinueApp({required BuildContext context}) {
  var d = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: EdgeInsets.all(20),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.60,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color0.withOpacity(0.5),
            child: Icon(
              Icons.done_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          text(
            title: "Your appointment booking \n is successfully",
            fontSize: 20,
            color: Color0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          text(
            title:
                "You can view the appointment booking info \n in the \"Appointment\" Section",
            fontSize: 15,
            color: Colors.grey,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              //////////////////////////////
              // makePayment();
            },
            child: Container(
              width: 280,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: Color0),
              // onPressed: () {},
              child: text(
                  title: 'Countinue Booking',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              // style: ElevatedButton.styleFrom(
              //     backgroundColor: secondaryColor,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25)),
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          text(
            title: "Go to appointment",
            fontSize: 15,
            color: Colors.black54,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  showDialog(context: context, builder: (_) => d);
}
