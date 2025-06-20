import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/add_auctions_cubit.dart';

Row text_from_field_name_color_widght(
    BuildContext context, AddAuctionsCubit cubit) {
  return Row(
    children: [
      TextFieldWidght(
        widthC: MediaQuery.of(context).size.width * 0.4,
        controller: cubit.nameController,
        context: context,
        hintText: "Name",
        messageForm: 'Please enter your Name',
        keyboardType: TextInputType.name,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.019,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(5.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1, color: Color0)),
          child: DropdownButton<String>(
            hint: text(title: 'Select color', color: Color4),
            value: cubit.selectedColor,
            onChanged: (String? newValue) {
              cubit.chaingSelectColor(color: newValue!);
            },
            items: cubit.horseColors.map((String color) {
              return DropdownMenuItem<String>(
                value: color,
                child: text(title: color, color: Color4),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}
