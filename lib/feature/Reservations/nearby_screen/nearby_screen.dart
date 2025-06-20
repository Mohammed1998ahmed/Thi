import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/nearby_screen/logic/cubit/neabry_screen_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/AppBarWidght.dart';
import 'ui/popularStablesNearbyWidght.dart';

// ignore: must_be_immutable
class NearbyScreen extends StatelessWidget {
  // ignore: unused_field
  final int IdCategoires;
  // ignore: unused_field
  int _page = 0;
  int selected_page = 0;
  TextEditingController SearchController = TextEditingController();
  bool selectService = false;

  NearbyScreen({super.key, required this.IdCategoires});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeabryScreenCubit()..getDateGaregories(IdCategoires),
      child: BlocConsumer<NeabryScreenCubit, NeabryScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = NeabryScreenCubit.getObject(context);
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(10),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: AppBarWidght(width: width),
                    ),
                    Divider(
                      color: Color3,
                      thickness: 2,
                    ),
                    PopularStablesNearbyWidght(
                        height: height, width: width, cubit: cubit),
                    SizedBox(
                      height: height * 0.03,
                    ),
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

class SpecialPackageOffersWidght extends StatelessWidget {
  const SpecialPackageOffersWidght({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(
                color: Color(0x80BE8FFF), blurRadius: 8, offset: Offset(3, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/5098150942_edd833a6d7_b.jpg"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 185,
                      child: text(
                          title: "LOOK AWESOME & SAVE MORE DISCOUNT",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          text(
                            title: "Book Now",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(239, 191, 255, 1),
                          ),
                          text(
                            title: "250 AED",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              text(
                title: "Al Jiyad Stables",
                fontSize: 15,
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_rate,
                    color: Colors.amber,
                  ),
                  label: text(
                    title: '5.0',
                    color: Colors.black,
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: text(
              title: "288 McClure Court, Arkansasgffrehhhheeeeee",
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
