import 'package:flutter/material.dart';
import 'package:thi/feature/Reservations/Booking/Course/getCoursList.dart';
import 'package:thi/feature/Reservations/Booking/Individual_booking.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

class SeleectBooking extends StatelessWidget {
  const SeleectBooking(
      {Key? key,
      required this.Idtrinner,
      required this.Idclub,
      required this.IdServic})
      : super(key: key);

  final int Idclub;
  final int IdServic;
  final int Idtrinner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                imageBackground,
              ),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonStaic(
              onTap: () {
                // يتم تنفيذ هذا الكود عند النقر على الزر
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => DataBooking(
                      Idclub: Idclub,
                      IdServic: IdServic,
                      Idtrinner: Idtrinner,
                    ),
                  ),
                );
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
                    builder: (BuildContext context) => GetCoursList(
                      Idclub: Idclub,
                      IdServic: IdServic,
                      Idtrinner: Idtrinner,
                    ),
                  ),
                );
              },
              title: "Full Course",
              context: context),
        ],
      ),
    ));
  }
}
