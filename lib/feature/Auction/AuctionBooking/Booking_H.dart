import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thi/feature/Auction/AuctionBooking/logic/cubit/day_booking_cubit.dart';
import 'package:thi/feature/Auction/DetlisHours/detailsHoroses.dart';

import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/AuctionHours.dart';
import 'ui/shimmerWidght.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool shimmer = true;
  String? Data;
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => DayBookingCubit(),
      child: BlocConsumer<DayBookingCubit, DayBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = DayBookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: text(
                      title: 'Auctions Calendar',
                      color: Color0,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                  leading: Container(),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        color: Color0,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: <BoxShadow>[]),
                        margin: EdgeInsets.all(15),
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
                                          return isSameDay(_selectedDay, day);
                                        },
                                        headerStyle: HeaderStyle(
                                          titleCentered: true,
                                          formatButtonVisible: false,
                                        ),
                                        headerVisible: true,
                                        availableCalendarFormats: const {
                                          CalendarFormat.month: '',
                                        },
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          setState(() {
                                            _selectedDay = selectedDay;
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(_selectedDay!);
                                            print('$formattedDate');
                                            Data = formattedDate;
                                            Navigator.pop(context);
                                            if (Data != null) {
                                              cubit.postUpComing(date: Data!);
                                            }
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
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                text(
                                  title: Data == null
                                      ? "12 12 2024"
                                      : Data.toString(),
                                  textAlign: TextAlign.center,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            )),
                      ),
                      cubit.myDataAuctionModel == null
                          ? Center(child: SpinkitWave())
                          : Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Divider(
                                      thickness: 2.0,
                                      color: Color0,
                                    ),
                                    cubit.myDataAuctionModel!.auctions == null
                                        ? Container(
                                            width: width,
                                            height: height * 0.84,
                                            child: Center(
                                                child:
                                                    text(title: "Not Found")))
                                        : Container(
                                            width: width,
                                            height: height * 0.84,
                                            child: ListView.builder(
                                              itemCount: cubit
                                                  .myDataAuctionModel!
                                                  .auctions!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return cubit.myDataAuctionModel!
                                                            .auctions ==
                                                        null
                                                    ? shimmerWidght(
                                                        width, height)
                                                    : AuctionHours(
                                                        context: context,
                                                        assetName: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .images![0]
                                                            .toString(),
                                                        title1: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .description
                                                            .toString(),
                                                        textColor: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .color
                                                            .toString(),
                                                        textBirthData: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .birth
                                                            .toString(),
                                                        textGender: cubit
                                                            .myDataAuctionModel!
                                                            .auctions![index]
                                                            .horses!
                                                            .gender
                                                            .toString(),
                                                        textPrice: '${cubit.myDataAuctionModel!.auctions![index].initialPrice.toString()} AED',
                                                        textName: cubit.myDataAuctionModel!.auctions![index].horses!.name.toString(),
                                                        // titleData: '1${index}d 18h 50m',
                                                        onTap: () {
                                                          Navigator.push<void>(
                                                            context,
                                                            MaterialPageRoute<
                                                                void>(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  DetailsHoeoses(
                                                                IDActions: cubit
                                                                    .myDataAuctionModel!
                                                                    .auctions![
                                                                        index]
                                                                    .horses!
                                                                    .auctionId!,
                                                              ),
                                                            ),
                                                          );
                                                        });
                                              },
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 100,
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
}
