import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

class Topservices extends StatelessWidget {
  const Topservices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title: "Top services",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color0,
        ),
        TextButton(
          onPressed: () {},
          child: text(
            title: "View all",
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
