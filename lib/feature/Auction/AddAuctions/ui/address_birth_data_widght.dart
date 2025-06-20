import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/add_auctions_cubit.dart';

// ignore: must_be_immutable
class Address_birth_data_widght extends StatefulWidget {
  Address_birth_data_widght(
      {super.key,
      required this.cubit,
      this.selectedDay,
      required this.context});
  final AddAuctionsCubit cubit;
  DateTime? selectedDay;
  final BuildContext context;
  @override
  State<Address_birth_data_widght> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Address_birth_data_widght> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFieldWidght(
          widthC: MediaQuery.of(context).size.width * 0.4,
          controller: widget.cubit.addressController,
          context: context,
          hintText: "address",
          messageForm: 'Please enter your address',
          keyboardType: TextInputType.streetAddress,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.019,
        ),
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
                              return isSameDay(widget.selectedDay, day);
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
                                widget.selectedDay = selectedDay;
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(widget.selectedDay!);
                                print('$formattedDate');
                                widget.cubit.BirthData = formattedDate;
                                Navigator.pop(context);
                                if (widget.cubit.BirthData != null) {}
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
                        title: widget.cubit.BirthData == null
                            ? " BirthData Hours"
                            : widget.cubit.BirthData.toString(),
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
// Row address_birth_data_widght(BuildContext context, AddAuctionsCubit cubit) {
//     return ;
//   }