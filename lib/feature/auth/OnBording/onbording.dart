import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/auth/Login/login.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/auth/OnBording/ui/selectOnbordingWidght.dart';

import 'logic/bloc.dart';
import 'logic/states.dart';
import 'ui/SmoothPageIndicatorWidght.dart';
import 'ui/background_image.dart';
import 'ui/images.dart';
import 'ui/introductory_text.dart';

class Onbording extends StatefulWidget {
  Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _W1State();
}

class _W1State extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<W1Cubitt, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = W1Cubitt.get(context);
        return Scaffold(
          body: Stack(children: [
            backgroundImage(),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: PageView(
                      controller: cubit.controller,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          cubit.currentPage = index;
                          //  currentPage = page;
                          cubit.isbutton = cubit.currentPage == 2;
                        });
                      },
                      children: [
                        images(context, name: pages[0].nameimage.toString()),
                        images(context, name: pages[1].nameimage.toString()),
                        images(context, name: pages[2].nameimage.toString()),
                      ],
                    ),
                  ),
                  SmoothPageIndicatorWidght(cubit: cubit),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,

                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: cubit.controller1,
                      onPageChanged: (index) {
                        setState(() {
                          cubit.currentPage1 = index;
                          cubit.isbutton = cubit.currentPage1 == 2;
                        });
                      },
                      children: [
                        introductory_text(),
                        introductory_text(
                            title: "Actions that fit you",
                            subtitle:
                                "Choose our Training sessions and auctions offer price Package that fit you."),
                        introductory_text(
                            title: "Actions that fit you",
                            subtitle:
                                "Book an appointment for Training sessions."),
                      ],
                    ),
                  ),
                  cubit.isbutton
                      ? ButtonStaic(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => LoginW(),
                              ),
                            );
                            // يتم تنفيذ هذا الكود عند النقر على الزر
                            print('تم النقر على الزر!' +
                                cubit.currentPage.toString() +
                                cubit.currentPage1.toString());
                          },
                          widthContainer:
                              MediaQuery.of(context).size.width * 0.30,
                          heightContainer: 50.0,
                          context: context,
                          title: "Get Started",
                        )
                      : selectOnbordingWidght(context, cubit: cubit),
                ]),
              ),
            )
          ]),
        );
      },
    );
  }
}
