import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';

class SearchWidght extends StatelessWidget {
  const SearchWidght({
    super.key,
    required this.height,
    required this.SearchController,
  });

  final double height;
  final TextEditingController SearchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: SearchController,
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(5),

            fillColor: LinearGradientColor01,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color0)),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
            hintText: "Search Stable",
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      ),
    );
  }
}
