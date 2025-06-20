import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';

class ShimmerWidght extends StatelessWidget {
  const ShimmerWidght({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimerWidght(
        width: width * 0.16,
        height: height * 0.2,
        reduis: 50,
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 30, bottom: 6),
        child: ShimerWidght(
          width: width * 0.02,
          height: height * 0.03,
        ),
      ),
      subtitle: ShimerWidght(
        width: width * 0.02,
        height: height * 0.03,
      ),
      trailing: Column(
        children: [
          ShimerWidght(
            width: width * 0.14,
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.004,
          ),
          ShimerWidght(
            width: width * 0.09,
            height: height * 0.04,
            reduis: 50,
          ),
        ],
      ),
    );
  }
}
