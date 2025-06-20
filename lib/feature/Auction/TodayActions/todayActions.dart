import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Auction/AuctionCalender/logic/cubit/auction_calender_cubit.dart';
import 'package:thi/feature/Auction/DetlisHours/detailsHoroses.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/auctionHours.dart';
import 'ui/shimmerWidght.dart';

class TodayActionsScreen extends StatefulWidget {
  const TodayActionsScreen({Key? key, required this.cubit}) : super(key: key);
  final AuctionCalenderCubit cubit;

  @override
  State<TodayActionsScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<TodayActionsScreen> {
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
      create: (context) => AuctionCalenderCubit()
        ..geTodyActions()
        ..postShareAuctonBoolean(),
      child: BlocConsumer<AuctionCalenderCubit, AuctionCalenderState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AuctionCalenderCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.fill),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: cubit.getTodayActions == null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: SpinkitWave()),
                    )
                  : cubit.getTodayActions!.auctions == null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
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
                                      title: "Auctions Calendar",
                                      color: Color0)),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                              ),
                              Center(
                                child: text(title: "Not Found"),
                              )
                            ],
                          ),
                        )
                      : SingleChildScrollView(
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
                                title: cubit.getTodayActions == null
                                    ? Container()
                                    : cubit.getTodayActions!.auctions == null
                                        ? text(
                                            title: "Auctions Calendar",
                                            color: Color0)
                                        : text(
                                            title:
                                                '${cubit.getTodayActions == null ? 0 : cubit.getTodayActions!.auctions!.length.toString()} Houses',
                                            color: Color0,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900),
                                actions: [
                                  cubit.getTodayActions!.auctions == null
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
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
                              Container(
                                width: width,
                                height: height * 0.84,
                                child: ListView.builder(
                                  itemCount:
                                      cubit.getTodayActions!.auctions!.length,
                                  itemBuilder: (context, index) {
                                    return cubit.getTodayActions == null
                                        ? shimmerWidght(width, height)
                                        : AuctionHours(
                                            context: context,
                                            AuctionCalenderCubit: cubit,
                                            ID_Auction: cubit
                                                .getTodayActions!
                                                .auctions![index]
                                                .horses!
                                                .auctionId!,
                                            assetName: cubit
                                                .getTodayActions!
                                                .auctions![index]
                                                .horses!
                                                .images![0]
                                                .toString(),
                                            title1: cubit.getTodayActions!.auctions![index].description
                                                .toString(),
                                            textColor: cubit.getTodayActions!
                                                .auctions![index].horses!.color
                                                .toString(),
                                            textBirthData: cubit
                                                .getTodayActions!
                                                .auctions![index]
                                                .horses!
                                                .birth
                                                .toString(),
                                            textGender: cubit.getTodayActions!
                                                .auctions![index].horses!.gender
                                                .toString(),
                                            textPrice:
                                                '${cubit.getTodayActions!.auctions![index].initialPrice.toString()} AED',
                                            textName: cubit.getTodayActions!
                                                .auctions![index].horses!.name
                                                .toString(),
                                            // titleData: '1${index}d 18h 50m',
                                            onTap: () {
                                              Navigator.push<void>(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          DetailsHoeoses(
                                                    IDActions: cubit
                                                        .getTodayActions!
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
