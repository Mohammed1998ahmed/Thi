import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

class PopularStablesNearby extends StatelessWidget {
  const PopularStablesNearby({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title: "Popular Stables nearby",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0,
        ),
        TextButton(
            onPressed: () {},
            child: text(
              title: "View all",
              fontSize: 14,
            )),
      ],
    );
  }
}
