import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';

class Loacation extends StatelessWidget {
  const Loacation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              label: text(
                title: "Abu Dhabi",
                fontSize: 12,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
