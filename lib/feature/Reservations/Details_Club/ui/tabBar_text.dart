import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';

Container tabBar_text() {
  return Container(
    color: Color.fromRGBO(71, 181, 255, 1),
    child: TabBar(
      labelColor: Color3,
      indicatorColor: Color3,
      unselectedLabelColor: Color3,
      // Color.fromRGBO(5, 0, 0, 0.5),
      tabs: [
        Tab(text: 'About'),
        Tab(text: 'Services'),
        Tab(text: 'Gallery'),
        Tab(text: 'Review'),
      ],
    ),
  );
}
