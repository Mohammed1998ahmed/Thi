import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import '../Home_Club/logic/cubit/home1_cubit.dart';
import 'package:animated_search_bar/animated_search_bar.dart';

import 'ui/bestStablesSearchWidght.dart';
import 'ui/bestStablesWidght.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => Home1Cubit(),
      child: BlocConsumer<Home1Cubit, Home1State>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = Home1Cubit.getObject(context);

          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: text(title: "Search_Page", color: Color4),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: height * 0.061,
                      // ),
                      // text(
                      //   title: "Find and book best services",
                      //   fontSize: 22,
                      //   fontWeight: FontWeight.w700,
                      //   color: Color(0xFF23002C),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedSearchBar(
                          // animationDuration: Duration(milliseconds: 33350),
                          // duration: Duration(milliseconds: 33300),
                          controller: cubit.SeachController,
                          label: "Find and book best services",
                          labelStyle: TextStyle(
                              fontFamily: 'Caveat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          onChanged: (value) {
                            debugPrint('value on Change');
                            print(value.toString() + "OOOOOOOOOOOO");
                            setState(() {
                              // searchText = value;
                            });
                            print(value.toString());
                            cubit.getDataSearch(value.isEmpty ? "0" : value);
                          },
                          onFieldSubmitted: (value) {
                            print(value.toString() + "PPPPPPPPPPPPPPPPPPPPPPP");
                          },
                        ),
                      ),

                      cubit.SeachController.text.isNotEmpty
                          ? cubit.istoggel
                              ? BestStablesSearchWidght(
                                  height: height,
                                  home1state: state,
                                  width: width,
                                  cubit: cubit)
                              : Container(
                                  height: height * 0.2,
                                  alignment: Alignment.center,
                                  child: text(
                                      title: "Not Found",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center),
                                )
                          : Container(
                              height: height * 0.2,
                              child: BestStablesWidght(
                                  height: height, width: width, cubit: cubit),
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
