import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/add_auctions_cubit.dart';

// ignore: must_be_immutable
class Data_start_end_widght extends StatefulWidget {
  Data_start_end_widght(
      {super.key,
      required this.context,
      required this.cubit,
      required this.selectedDay1});
  final BuildContext context;
  final AddAuctionsCubit cubit;
  DateTime? selectedDay1;
  @override
  State<Data_start_end_widght> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Data_start_end_widght> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Color0,
                    backgroundColor: Color0,
                    minimumSize: const Size(311, 44),
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: AlertDialog(
                          title: Text('Select a Date'),
                          content: TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            calendarFormat: CalendarFormat.month,
                            selectedDayPredicate: (day) {
                              return isSameDay(widget.selectedDay1, day);
                            },
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                            ),
                            headerVisible: true,
                            availableCalendarFormats: const {
                              CalendarFormat.month: '',
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                widget.selectedDay1 = selectedDay;
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(widget.selectedDay1!);
                                print('$formattedDate');
                                widget.cubit.Data = formattedDate;
                                Navigator.pop(context);
                                if (widget.cubit.Data != null) {}
                              });
                            },
                            onHeaderTapped: (focusedDay) {
                              print('رفع التقويم للأعلى');
                            },
                          ),
                        ),
                      );
                    },
                  );

                  print("Deta 1010010101010010100101010");
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: text(
                        title: widget.cubit.Data == null
                            ? "Start Auction "
                            : widget.cubit.Data.toString(),
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Spacer(),
                    Expanded(
                      child: Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.019,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
            // margin: EdgeInsets.all(15),
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Color0,
                    backgroundColor: Color0,
                    minimumSize: const Size(311, 44),
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: AlertDialog(
                          title: Text('Select a Date'),
                          content: TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            calendarFormat: CalendarFormat.month,
                            selectedDayPredicate: (day) {
                              return isSameDay(widget.selectedDay1, day);
                            },
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                            ),
                            headerVisible: true,
                            availableCalendarFormats: const {
                              CalendarFormat.month: '',
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                widget.selectedDay1 = selectedDay;
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(widget.selectedDay1!);
                                print('$formattedDate');
                                widget.cubit.Data1 = formattedDate;
                                Navigator.pop(context);
                                if (widget.cubit.Data1 != null) {}
                              });
                            },
                            onHeaderTapped: (focusedDay) {
                              print('رفع التقويم للأعلى');
                            },
                          ),
                        ),
                      );
                    },
                  );

                  print("Deta 1010010101010010100101010");
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: text(
                        title: widget.cubit.Data1 == null
                            ? " End Auction "
                            : widget.cubit.Data1.toString(),
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Spacer(),
                    Expanded(
                      child: Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
