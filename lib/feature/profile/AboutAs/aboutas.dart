import 'package:flutter/material.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

class About_As extends StatelessWidget {
  const About_As({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hieght = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
          width: width,
          height: hieght,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageBackground), fit: BoxFit.cover)),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width * 0.4,
                      height: hieght * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/horse jumping-cuate.png"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      child: text(
                          color: Color4,
                          title:
                              "- The application is divided into three main sections: reservations, auctions, and healthcare.\n - The reservations section offers a booking mechanism for horse riding training, including various types of training like jumping. \n - Booking can be done individually or as a group, even for the entire family within a riding course.\n - The auctions section displays current and upcoming auctions with detailed information, including videos showing horse movements.\n - It also includes search functionality based on dates for participating or viewing auctions, as well as a page for complaints or support requests.\n - The healthcare section provides consultations to equestrian centers, which in turn offer appropriate assistance and showcase their services.\n - The app also features chat options between users and trainers, as well as with healthcare professionals.\n  - Overall, the app's profile includes many clear functions during use, such as displaying participated auctions, sessions, favorite equestrian clubs, and more."),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          text(title: "to connect : ", color: Colors.green),
                          text(
                              title: " mohammedsh99999ahmed@gmail.com",
                              color: Colors.green,
                              fontSize: 16),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
