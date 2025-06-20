import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';

Padding CardWidght(
    {BuildContext? context,
    void Function()? onTap,
    String? assetName,
    required String title,
    required String subtitle}) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Card(
          color: Color0.withOpacity(0.7),
          shadowColor: Color0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context!).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color4,
                  image: DecorationImage(
                    image: AssetImage(assetName ?? 'assets/images/img_21.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        title: title,
                        color: Color3.withOpacity(0.8),
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w900),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: Color3.withOpacity(0.8),
                          size: 35,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07),
                        text(
                            title: subtitle,
                            color: Color3.withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}
