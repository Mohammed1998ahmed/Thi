import 'package:flutter/material.dart';

import '../../../../core/widght/Widght.dart';

Container shimer_widghts(double width, double height) {
  return Container(
    width: width,
    height: height,
    child: ListView.builder(
      itemBuilder: (BuildContext, int) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimerWidght(
                width: width * 0.90,
                height: height * 0.2,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ShimerWidght(
                width: width * 0.50,
                height: height * 0.028,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ShimerWidght(
                width: width * 0.40,
                height: height * 0.028,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ShimerWidght(
                width: width * 0.30,
                height: height * 0.028,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ShimerWidght(
                width: width * 0.450,
                height: height * 0.028,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ShimerWidght(
                      width: width * 0.250,
                      height: height * 0.028,
                    ),
                    Spacer(),
                    ShimerWidght(
                      width: width * 0.250,
                      height: height * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 6,
    ),
  );
}
