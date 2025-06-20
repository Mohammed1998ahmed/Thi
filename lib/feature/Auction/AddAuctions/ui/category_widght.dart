import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../logic/cubit/add_auctions_cubit.dart';

Container category_widght(BuildContext context, AddAuctionsCubit cubit) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.90,
    height: MediaQuery.of(context).size.height * 0.080,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      border: Border.all(
        color: Color0,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: cubit.categoryController,

        keyboardType: TextInputType
            .emailAddress, // تغيير نوع لوحة المفاتيح إلى البريد الإلكتروني
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color5,
          ),
          hintText: "Category", // تغيير نص التلميح لصيغة البريد الإلكتروني
        ),
      ),
    ),
  );
}
