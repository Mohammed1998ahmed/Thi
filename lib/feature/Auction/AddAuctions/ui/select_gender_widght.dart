import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/add_auctions_cubit.dart';

Container select_gender_widght(BuildContext context, AddAuctionsCubit cubit) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.70,
    height: MediaQuery.of(context).size.height * 0.05,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          // أو Flexible
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: Color0,
            // tileColor: Colors.red,

            title: text(
              title: 'Male',
              fontSize: 16,
              color: Color4,
              fontWeight: FontWeight.w400,
            ),
            value: 1,
            groupValue: cubit.selectedValue,
            onChanged: (int? value) {
              cubit.chaingSelectValue(value!);
              cubit.SelectGender("Male");
            },
          ),
        ),
        Container(
          width: 110,
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: Color0,
            title: text(
              title: 'Woman',
              fontSize: 16,
              color: Color4,
              fontWeight: FontWeight.w400,
            ),
            value: 2,
            groupValue: cubit.selectedValue,
            onChanged: (value) {
              cubit.chaingSelectValue(value!);
              cubit.SelectGender("Woman");
            },
          ),
        ),
      ],
    ),
  );
}
