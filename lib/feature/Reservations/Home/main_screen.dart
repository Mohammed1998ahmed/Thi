// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thi/feature/Reservations/Home/logic/cubit/main_screen_cubit.dart';
import 'package:thi/feature/Reservations/Search/searchPage.dart';
import 'package:thi/core/widght/Widght.dart';

import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/menu/DrwerPage.dart';

import '../Notifaction/NotifactionU.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
    this.pagep,
  }) : super(key: key);
  final int? pagep;
  int m = 2;
  // ignore: unused_field
  int _page = 0;

  int selected_page = 0;
  bool shimmer = true;
  bool about = true;
  bool chat = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit()..configurePusher(),
      child: BlocConsumer<MainScreenCubit, MainScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MainScreenCubit.getObject(context);
          // ignore: unused_local_variable
          double width = MediaQuery.of(context).size.width;
          // ignore: unused_local_variable
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
              body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DrwerPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.dehaze_outlined,
                      size: 30,
                      color: Color0,
                    )),
                title: text(
                  title: 'THI',
                  textAlign: TextAlign.center,
                  color: Color0,
                  fontSize: 46,
                  fontWeight: FontWeight.w700,
                ),
                actions: [
                  Stack(alignment: Alignment.centerRight, children: [
                    Container(
                      width: width * 0.11,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    NotificationScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: Color0,
                            size: 33,
                          )),
                    ),
                  ]),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SearchPage()));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Color0,
                        size: 32,
                      )),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: cubit.ListWidght[cubit.index],
              // drawer: Drawer(),
              bottomNavigationBar: CurvedNavigationBar(
                height: 60.0,

                items: cubit.iconNav(),

                color: Color.fromRGBO(71, 181, 255, 0.678), // Colors.black,
                buttonBackgroundColor: Color0,
                backgroundColor: Color.fromRGBO(71, 181, 255,
                    0.185), // Colors.transparent.withOpacity(0.0),
                animationCurve: Curves.easeInOutQuart,
                index: cubit.index,
                animationDuration: Duration(milliseconds: 600),
                onTap: (index) {
                  cubit.chaingindex(index);
                  print(index.toString() +
                      "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
                  // cubit.chaingindex(index);
                },
                // letIndexChange: (index) => false,
              ),
            ),
          ));
        },
      ),
    );
  }
}
