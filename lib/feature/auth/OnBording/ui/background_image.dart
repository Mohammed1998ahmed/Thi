import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageBackground,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
