import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Auction/DetlisHours/detailsHoroses.dart';
import 'package:thi/feature/Auction/FilterScreen/logic/cubit/filter_screen_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/AuctionHours.dart';
import 'ui/shimmerWidght.dart';

class filterScreen extends StatefulWidget {
  const filterScreen({Key? key, required this.date}) : super(key: key);
  final String date;
  @override
  State<filterScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  String? selectedOption;
  bool shimer = true;
  List<String> options = [
    'Price',
    'Data',
  ];
  @override
  void initState() {
    super.initState();
    selectedOption = options[0]; // تعيين الخيار الأول كافتراضي
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => FilterScreenCubit()..postUpComing(date: widget.date),
      child: BlocConsumer<FilterScreenCubit, FilterScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = FilterScreenCubit.getObject(context);
          return Scaffold(
            body: cubit.postUpcomingActions == null
                ? Center(child: SpinkitWave())
                : Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageBackground), fit: BoxFit.fill),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppBar(
                            leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Color0,
                                size: 30,
                              ),
                            ),
                            centerTitle: true,
                            toolbarHeight: 80,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: text(
                                title:
                                    '${cubit.postUpcomingActions!.auctions == null ? 0 : cubit.postUpcomingActions!.auctions!.length} Houses',
                                color: Color0,
                                fontSize: 22,
                                fontWeight: FontWeight.w900),
                            actions: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2.0,
                            color: Color0,
                          ),
                          cubit.postUpcomingActions!.auctions == null
                              ? Container(
                                  width: width,
                                  height: height * 0.84,
                                  child:
                                      Center(child: text(title: "Not Found")))
                              : Container(
                                  width: width,
                                  height: height * 0.84,
                                  child: ListView.builder(
                                    itemCount: cubit
                                        .postUpcomingActions!.auctions!.length,
                                    itemBuilder: (context, index) {
                                      print(
                                          "***************************************************************sdjkj");
                                      return cubit.postUpcomingActions!.auctions ==
                                              null
                                          ? shimmerWidght(width, height)
                                          : AuctionHours(
                                              context: context,
                                              assetName: cubit
                                                  .postUpcomingActions!
                                                  .auctions![index]
                                                  .horses!
                                                  .images![0]
                                                  .toString(),
                                              title1: cubit.postUpcomingActions!
                                                  .auctions![index].description
                                                  .toString(),
                                              textColor: cubit
                                                  .postUpcomingActions!
                                                  .auctions![index]
                                                  .horses!
                                                  .color
                                                  .toString(),
                                              textBirthData: cubit
                                                  .postUpcomingActions!
                                                  .auctions![index]
                                                  .horses!
                                                  .birth
                                                  .toString(),
                                              textGender: cubit
                                                  .postUpcomingActions!
                                                  .auctions![index]
                                                  .horses!
                                                  .gender
                                                  .toString(),
                                              textPrice:
                                                  '${cubit.postUpcomingActions!.auctions![index].initialPrice.toString()} AED',
                                              textName: cubit.postUpcomingActions!.auctions![index].horses!.name.toString(),
                                              // titleData: '1${index}d 18h 50m',
                                              onTap: () {
                                                Navigator.push<void>(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                    builder: (BuildContext
                                                            context) =>
                                                        DetailsHoeoses(
                                                      IDActions: cubit
                                                          .postUpcomingActions!
                                                          .auctions![index]
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
          );
        },
      ),
    );
  }

  void showDropdownMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sort by'),
          content: DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }
}
