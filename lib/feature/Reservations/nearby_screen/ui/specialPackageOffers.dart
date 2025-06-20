import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

class SpecialPackageOffers extends StatelessWidget {
  const SpecialPackageOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title: "Special package & offers",
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
