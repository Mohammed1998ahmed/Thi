import 'package:flutter/material.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'AuctiondsUserID.dart';
import 'winAuction.dart';

class SelectTypeAuction extends StatelessWidget {
  const SelectTypeAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBackground), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonStaic(
                onTap: () {
                  // يتم تنفيذ هذا الكود عند النقر على الزر

                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => AuctionNav(),
                    ),
                  );

                  print('تم النقر على الزر!');
                },
                title: "Auctions subscribed",
                context: context),
            SizedBox(
              height: 20,
            ),
            ButtonStaic(
                onTap: () {
                  // يتم تنفيذ هذا الكود عند النقر على الزر

                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => AuctionWin(),
                    ),
                  );

                  print('تم النقر على الزر!');
                },
                title: "Auctions won",
                context: context),
          ],
        ),
      ),
    );
  }
}
