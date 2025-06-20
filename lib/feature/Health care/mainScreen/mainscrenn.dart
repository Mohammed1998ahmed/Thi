import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Health%20care/mainScreen/logic/cubit/main_helth_cubit.dart';
import 'package:thi/core/component/conset/Const.dart';

// ignore: must_be_immutable
class MainScreenheLTH extends StatelessWidget {
  MainScreenheLTH({
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
      create: (context) => MainHelthCubit(),
      child: BlocConsumer<MainHelthCubit, MainHelthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MainHelthCubit.getObjet(context);
          // ignore: unused_local_variable
          double width = MediaQuery.of(context).size.width;
          // ignore: unused_local_variable
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
              // backgroundColor: Colors.transparent,
              body: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: cubit.ListWidght[cubit.index],
              drawer: Drawer(),
              bottomNavigationBar: CurvedNavigationBar(
                height: 60.0,

                items: cubit.iconNav(),

                color: Color.fromRGBO(71, 181, 255, 0.678), // Colors.black,
                buttonBackgroundColor: Color0,
                backgroundColor: Color.fromRGBO(71, 181, 255, 0.253),
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
