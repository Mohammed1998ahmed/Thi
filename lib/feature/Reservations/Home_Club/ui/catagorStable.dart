import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

class CatagorStable extends StatelessWidget {
  const CatagorStable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(40, 168, 253, 1),
                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                Color.fromRGBO(134, 255, 255, 1), // اللون المتناسق
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: text(
              title: "Top categories",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color3,
            ),
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: text(
        //       title: "View all", fontSize: 16, fontWeight: FontWeight.w600),
        // ),
      ],
    );
  }
}
