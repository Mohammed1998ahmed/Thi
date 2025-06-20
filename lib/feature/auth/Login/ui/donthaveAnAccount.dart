import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Register/Register.dart';

class DonthaveAnAccount extends StatelessWidget {
  const DonthaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text(
          title: "Don’t have an account?",
          color: Color2,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        TextButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Register(),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.22,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                    Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: text(
                    title: "register Now",
                    color: Color3,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            )),
      ],
    );
  }
}
