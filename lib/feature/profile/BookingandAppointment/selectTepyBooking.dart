import 'package:flutter/material.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/BookingandAppointment/BookingandApp.dart';
import 'package:thi/feature/profile/BookingandAppointment/fullCours.dart';

class SelectTypeBooking extends StatelessWidget {
  const SelectTypeBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBackground), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonStaic(
                onTap: () {
                  // يتم تنفيذ هذا الكود عند النقر على الزر

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => BookingandApp(),
                    ),
                  );

                  print('تم النقر على الزر!');
                },
                title: "Individual Booking",
                context: context),
            SizedBox(
              height: 20,
            ),
            ButtonStaic(
                onTap: () {
                  // يتم تنفيذ هذا الكود عند النقر على الزر

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => FullCoursBooking(),
                    ),
                  );

                  print('تم النقر على الزر!');
                },
                title: "Full Course",
                context: context),
          ],
        ),
      ),
    );
  }
}
