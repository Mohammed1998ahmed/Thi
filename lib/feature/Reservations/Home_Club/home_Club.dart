// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/Home/logic/cubit/main_screen_cubit.dart';
import 'package:thi/feature/Reservations/Home_Club/logic/cubit/home1_cubit.dart';

import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'ui/bastStablesWidght.dart';
import 'ui/bestStables.dart';
import 'ui/bestStablesSearchWidght.dart';
import 'ui/catagorStable.dart';
import 'ui/catagoryWidght.dart';
import 'ui/shimmerWidght.dart';

class Home1 extends StatelessWidget {
  Home1({Key? key}) : super(key: key);
  bool istoggel = true;
  bool loadingSearch = true;
  int currentIndex = 0;
  final List<String> images = [
    'assets/images/clinic18.jpg',
    'assets/images/gp-bargersville-veterinary-hospital-storefront.png',
    'assets/images/08F30214-35C7-4649-87DC-CA789BD029E9.jpeg',
    'assets/images/49772470_1779640922140641_3989261213316939776_n.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Home1Cubit()
        ..getDataClubList()
        ..getDateGaregories()
        ..getDateIDOfferClubs()
        ..configurePusher()
        ..configurePusherCategory()
        ..getHomeHelthOffers(),
      child: BlocConsumer<Home1Cubit, Home1State>(
        listener: (context, state) {
          if (state is Home1SearchClubLoading) {
            loadingSearch = true;
          }

          if (state is Home1SearchClubError) {
            istoggel = false;
          }
          if (state is Home1SearchClubSueccsufuly) {
            istoggel = true;
            loadingSearch = false;
          }
        },
        builder: (context, state) {
          final cubit = Home1Cubit.getObject(context);
          // ignore: unused_local_variable
          final cubitMainScreen = MainScreenCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return cubit.shimmer == true
              ? ShimmerWidght(width: width, height: height)
              : LiquidPullToRefresh(
                  onRefresh: () async {
                    cubit.getDataClubList();
                  },
                  animSpeedFactor: 3.0,
                  backgroundColor: Color0,
                  borderWidth: 3.0,
                  height: height * 0.3,
                  springAnimationDurationInMilliseconds: 2000,
                  color: Color4,
                  showChildOpacityTransition: false,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          cubit.alloffersModel == null
                              ? Container()
                              : cubit.alloffersModel!.offers == null
                                  ? Container()
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.24,
                                      width: double.infinity,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          reverse: true,
                                          height: height * 0.24,
                                          autoPlay: true,
                                          aspectRatio: 3,
                                          enlargeCenterPage: true,
                                          onPageChanged: (index, reason) {},
                                        ),
                                        items: cubit.alloffersModel!.offers!
                                            .map(
                                              (offer) => Stack(
                                                alignment: AlignmentDirectional
                                                    .bottomStart,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Image.network(
                                                      ImagesPath +
                                                          offer.image
                                                              .toString(),
                                                      height: height * 0.24,
                                                      width: double.infinity,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: height * 0.09,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 6),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: text(
                                                                    title:
                                                                        "${offer.name}",
                                                                    color:
                                                                        Color0,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              Expanded(
                                                                child: text(
                                                                    title:
                                                                        "${offer.offerValue}% OFF",
                                                                    color:
                                                                        Color3,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            text(
                                                                title:
                                                                    "  Begin: ",
                                                                color: Color0,
                                                                fontSize: 15),
                                                            Expanded(
                                                              child: text(
                                                                  title:
                                                                      "${offer.begin}",
                                                                  color: Color3,
                                                                  fontSize: 15),
                                                            ),
                                                            text(
                                                                title:
                                                                    "  end: ",
                                                                color: Color0,
                                                                fontSize: 15),
                                                            Expanded(
                                                              child: text(
                                                                  title:
                                                                      "${offer.end}",
                                                                  color: Color3,
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Color4
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        15.0))),
                                                  )
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          CatagorStable(),
                          CatagoryWidght(
                              height: height, width: width, cubit: cubit),
                          SizedBox(
                            height: height * 0.0112,
                          ),
                          BestStables(),
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
                              : BestStablesWidght(
                                  height: height, width: width, cubit: cubit),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}






// class SeachWidght extends StatelessWidget {
//   const SeachWidght({
//     super.key,
//     required this.height,
//     required this.SeachController,
//     required this.cubit,
//   });

//   final double height;
//   final TextEditingController SeachController;
//   final Home1Cubit cubit;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 9),
//       child: Stack(
//         alignment: Alignment.center,
//         fit: StackFit.passthrough,
//         children: [
//           Container(
//             height: height * 0.07,
//             // width: MediaQuery.of(context).size.width *
//             //     0.99,
//             padding: EdgeInsets.symmetric(horizontal: 35),
//             child: Search(
//               SeachController: SeachController,
//               cubit: cubit,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(),
//               GestureDetector(
//                 onTap: () {
//                   // cubit.chaingLoading(false);

//                   print(SeachController.text +
//                       "OOOOOOOOOOOOOOOOOOOOOOOOOOOPPPPPPPPPPPPPPPPPPPIIIIIIIIII");
//                   cubit.getDataSearch(SeachController.text.isEmpty
//                       ? '0'
//                       : SeachController.text);
//                   // SeachController.clear();
//                   print("search");
//                 },
//                 child: cubit.isLoad
//                     ? SpinkitWave()
//                     : CircleAvatar(
//                         backgroundColor: Colors.black,
//                         radius: 30,
//                         child: Icon(
//                           Icons.search_rounded,
//                           color: Color0,
//                           size: 35,
//                         ),
//                       ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


