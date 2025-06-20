import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thi/feature/Reservations/Booking/Course/logic/cubit/cours_booking_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/appBar_details_cources.dart';
import 'ui/payment_Method_text.dart';

class CoursBookingDetials extends StatefulWidget {
  const CoursBookingDetials({
    Key? key,
    required this.amount,
    required this.Session_Name,
    required this.number_People,
    required this.course_id,
  }) : super(key: key);

  final int course_id;
  final int amount;
  final String Session_Name;
  final int number_People;

  @override
  State<CoursBookingDetials> createState() => _BookingDetialsState();
}

class _BookingDetialsState extends State<CoursBookingDetials> {
  List payment = ["credit", "Bank"];

  @override
  Widget build(BuildContext context) {
    double Heith = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    print(widget.amount.toString());
    // widget.bookingCubit.addListInt(widget.amount);
    return BlocProvider(
      create: (context) => CoursBookingCubit(),
      child: BlocConsumer<CoursBookingCubit, CoursBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CoursBookingCubit.getObject(context);
          return SafeArea(
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageBackground), fit: BoxFit.cover)),
                padding: EdgeInsets.all(10),
                width: Width,
                height: Heith,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBar_details_cources(context),
                      SizedBox(
                        height: Heith * 0.015,
                      ),
                      total_Price(Width),
                      SizedBox(
                        height: Heith * 0.02,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      payment_Method_text(),
                      pay_Cources(Heith, cubit, context, Width),
                      SizedBox(
                        height: Heith * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container pay_Cources(double Heith, CoursBookingCubit cubit,
      BuildContext context, double Width) {
    return Container(
      height: Heith * 0.3,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        GestureDetector(
          onTap: () {
            cubit.makePayment(widget.number_People * widget.amount,
                clasName: widget.Session_Name,
                course_id: widget.course_id,
                number_of_people: widget.number_People,
                context: context);
            // countinueApp();

            // Navigator.push<void>(
            //   context,
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) => OkBooking(),
            //   ),
            // );
          },
          child: Container(
            width: Width * 0.5,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: cubit.currentPayment == payment[0]
                      ? Color0.withOpacity(0.5)
                      : Colors.black,
                  width: 1),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Plain credit card-amico.png',
                  height: Heith * 0.1,
                  width: Width * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: Heith * 0.02,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        title: 'Credit/Debit Card',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      text(
                        title: 'Ending in 1560',
                        color: Colors.grey,
                        fontSize: 15,
                      )
                    ],
                  ),
                ),

                // Radio(
                //     value: payment[0],
                //     activeColor: secondaryColor,
                //     groupValue: currentPayment,
                //     onChanged: (value) {
                //       setState(() {
                //         currentPayment = value;
                //       });
                //     })
              ],
            ),
          ),
        ),
        SizedBox(
          width: Width * 0.03,
        ),
      ]),
    );
  }

  Align total_Price(double Width) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // onPressed: () {},
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Width * 0.04,
            ),
            text(
                title: 'Total :' +
                    (widget.number_People * widget.amount).toString() +
                    'AED',
                fontSize: 18,
                color: Color3),
          ],
        ),
      ),
    );
  }
}
