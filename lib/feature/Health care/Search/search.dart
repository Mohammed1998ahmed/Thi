import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Health%20care/Search/logic/cubit/search_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'package:animated_search_bar/animated_search_bar.dart';

import 'ui/bestStablesSearchWidght.dart';

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
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SearchCubit.getObject(context);

          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: text(title: "Search Health", color: Color4),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
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
                              // color: Color0,
                              child: Center(child: SpinkitWave()),
                              // child: BestStablesWidght(
                              //     height: height, width: width, cubit: cubit),
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
