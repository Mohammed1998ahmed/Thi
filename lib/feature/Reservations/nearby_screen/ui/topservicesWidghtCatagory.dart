import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/neabry_screen_cubit.dart';

class TopservicesWidghtCatagory extends StatelessWidget {
  const TopservicesWidghtCatagory({
    super.key,
    required this.height,
    required this.cubit,
  });

  final double height;
  final NeabryScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.99,
            width: MediaQuery.of(context).size.width * 0.30,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Color0, blurRadius: 5, offset: Offset(0, 5))
                ]),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    cubit.category[i]['image'],
                    width: 40,
                    height: 40,
                  ),
                ),
                text(title: cubit.category[i]['text'], fontSize: 10)
              ],
            ),
          );
        },
        itemCount: cubit.category.length,
      ),
    );
  }
}
