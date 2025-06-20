import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../ChangPassword/ChangPassWord.dart';

class Forgotyourpassword extends StatelessWidget {
  const Forgotyourpassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ChangPassword(),
                ),
              );
            },
            child: text(title: "Forgot your password?", color: Color2)),
        Spacer()
      ],
    );
  }
}
