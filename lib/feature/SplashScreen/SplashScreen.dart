import 'package:flutter/material.dart';
import 'package:thi/feature/Reservations/Home/main_screen.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import '../auth/OnBording/onbording.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import 'ui/shimerWidght.dart';
import 'ui/text2Shimmer.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _OnbordingState();
}

class _OnbordingState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // استدعاء دالة لتأخير الانتقال إلى الواجهة الأخرى بعد فترة زمنية
    Future.delayed(Duration(seconds: 2), () {
      CachShpreafapp.getdata(key: "tokenProfile") != null
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Onbording()),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/images (5).jpeg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/horse jumping-cuate.png',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(2000),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShimerWidghtt(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text2Shimmer(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  text(
                      title: "@ Melenuim 2023. All rights reserved.",
                      color: Color2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ]),
          ),
        )
      ]),
    );
  }
}
