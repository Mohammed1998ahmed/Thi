import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

class AppBarWidght extends StatelessWidget {
  const AppBarWidght({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text(
              title: "Categories",
              fontSize: 20,
              color: Color0,
              fontWeight: FontWeight.w700),
        ],
      ),
    );
  }
}
