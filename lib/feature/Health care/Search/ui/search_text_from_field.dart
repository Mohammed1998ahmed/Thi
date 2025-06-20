import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../logic/cubit/search_cubit.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.SeachController,
    required this.cubit,
  });

  final TextEditingController SeachController;
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: SeachController,
      onChanged: (value) {
        print(value.toString());
        cubit.getDataSearch(value.isEmpty ? "0" : value);
        // cubit.getDataSearch(search: value);
      },
      decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(5),
          fillColor: Color0,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: LinearGradientColor01),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color0)),
          // prefixIcon: Icon(
          //   Icons.search_rounded,
          //   color: Colors.black,
          // ),
          hintText: "    Search  Stable",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Caveat',
              fontWeight: FontWeight.w600)),
    );
  }
}
