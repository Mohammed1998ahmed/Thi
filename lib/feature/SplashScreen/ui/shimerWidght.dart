import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/component/conset/Const.dart';
import '../../../core/widght/Widght.dart';

class ShimerWidghtt extends StatelessWidget {
  const ShimerWidghtt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color0,
      highlightColor: Color.fromRGBO(71, 181, 255, 0.192),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 3,
            child: Divider(
              height: 2,
              color: Color0,
              thickness: 2,
            ),
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Color0,
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Color0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: text(
                title: "THI",
                color: Color0,
                fontSize: 31,
                fontWeight: FontWeight.w700),
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Color0,
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Color0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: 3,
            child: Divider(
              height: 2,
              color: Color0,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
