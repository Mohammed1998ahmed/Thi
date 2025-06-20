import 'package:flutter/material.dart';

class ImageRegister extends StatelessWidget {
  const ImageRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Image.asset(
          'assets/images/Sign up-cuate.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
