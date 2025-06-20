import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/component/conset/Const.dart';
import '../logic/bloc.dart';

Padding SmoothPageIndicatorWidght({required W1Cubitt cubit}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        SmoothPageIndicator(
          controller: cubit.controller,
          count: 3,
          effect: ExpandingDotsEffect(
            dotWidth: 12,
            dotHeight: 10,
            dotColor: Color4,
            activeDotColor: Color0,
          ), // يمكنك استخدام أي تأثير تفضيلي هنا
        ),
      ],
    ),
  );
}
