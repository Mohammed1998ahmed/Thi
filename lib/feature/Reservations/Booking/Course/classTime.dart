import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/Booking/Course/CoureBookingDatails.dart';
import 'package:thi/feature/Reservations/Booking/Course/logic/cubit/cours_booking_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/appBar_class.dart';
import 'ui/current_Issue.dart';
import 'ui/number_people_booking.dart';
import 'ui/time_start_end_class.dart';

class ClassTime extends StatefulWidget {
  const ClassTime({
    super.key,
    this.Cours_id,
  });
  final Cours_id;

  @override
  State<ClassTime> createState() => _ClassTimeState();
}

class _ClassTimeState extends State<ClassTime> {
  TextEditingController _textEditingController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursBookingCubit()
        ..getDatailsClassTime(cours_Id: widget.Cours_id)
        ..configurePusher(cours_Id: widget.Cours_id)
        ..configurePusher1(cours_Id: widget.Cours_id),
      child: BlocConsumer<CoursBookingCubit, CoursBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CoursBookingCubit.getObject(context);
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
              child: cubit.detailsClassModel == null
                  ? Center(child: SpinkitWave())
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.separated(
                        itemCount: cubit.detailsClassModel!.classes!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                appBar_class(cubit, index),
                                time_start_end_class(context, cubit, index),
                                current_Issue(),
                                number_people_booking(context, cubit, index),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Reservation"),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          _textEditingController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            "Enter a number",
                                                        errorText:
                                                            _errorMessage,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      if (_textEditingController
                                                          .text.isNotEmpty) {
                                                        String input =
                                                            _textEditingController
                                                                .text
                                                                .trim();

                                                        int countpoeple = int.parse(
                                                            _textEditingController
                                                                .text
                                                                .toString());
                                                        int capacity = cubit
                                                                .detailsClassModel!
                                                                .classes![index]
                                                                .capacity! -
                                                            cubit
                                                                .detailsClassModel!
                                                                .classes![index]
                                                                .counter!;

                                                        if (input.isNotEmpty &&
                                                            isNumeric(input) &&
                                                            countpoeple <=
                                                                capacity) {
                                                          _errorMessage = '';
                                                          setState(() {});

                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute<
                                                                void>(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  CoursBookingDetials(
                                                                amount: cubit
                                                                    .detailsClassModel!
                                                                    .classes![
                                                                        index]
                                                                    .price!,
                                                                course_id: cubit
                                                                    .detailsClassModel!
                                                                    .classes![
                                                                        index]
                                                                    .courseId!,
                                                                Session_Name: cubit
                                                                    .detailsClassModel!
                                                                    .classes![
                                                                        index]
                                                                    .class1
                                                                    .toString(),
                                                                number_People:
                                                                    int.parse(
                                                                        _textEditingController
                                                                            .text),
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          setState(() {
                                                            _errorMessage =
                                                                "Please enter a valid number";
                                                            print("object");
                                                          });
                                                        }
                                                      }
                                                    },
                                                    child: Text("Confirm"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Reservation",
                                          style: TextStyle(color: Color4),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
