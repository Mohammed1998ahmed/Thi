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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ShimerWidght(
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                ShimerWidght(
                  width: 80,
                  height: 50,
                ),
                SizedBox(
                  width: width * 0.13,
                ),
                ShimerWidght(
                  width: 40,
                  height: 50,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                ShimerWidght(
                  width: 40,
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ShimerWidght(
              width: width * 0.8,
              height: height * 0.06,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimerWidght(
                    width: width * 0.750,
                    height: height * 0.07,
                  ),
                ),
                ShimerWidght(
                  width: width * 0.20,
                  height: height * 0.09,
                  reduis: 50,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                ShimerWidght(
                  width: width * 0.30,
                  height: height * 0.04,
                ),
                Spacer(),
                ShimerWidght(
                  width: width * 0.20,
                  height: height * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              height: height * 0.2,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimerWidght(
                        width: width * 0.20,
                        height: height * 0.02,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                ShimerWidght(
                  width: width * 0.30,
                  height: height * 0.04,
                ),
                Spacer(),
                ShimerWidght(
                  width: width * 0.20,
                  height: height * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              height: height * 0.2,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext, int) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimerWidght(
                        width: width * 0.60,
                        height: height * 0.02,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
