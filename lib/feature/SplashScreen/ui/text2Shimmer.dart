import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/component/conset/Const.dart';
import '../../../core/widght/Widght.dart';

Shimmer Text2Shimmer() {
  return Shimmer.fromColors(
    baseColor: Color4,
    highlightColor: Color.fromRGBO(71, 181, 255, 1),
    child: Center(
      child: text(
          title: "HORSE AUCTIONS AND BOOKING AND Healthcare",
          color: Color2,
          fontSize: 16,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          fontWeight: FontWeight.w600),
    ),
  );
}
