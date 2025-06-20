import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/search_cubit.dart';
import 'search_text_from_field.dart';

class SeachWidght extends StatelessWidget {
  const SeachWidght({
    super.key,
    required this.height,
    required this.SeachController,
    required this.cubit,
  });

  final double height;
  final TextEditingController SeachController;
  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          Container(
            height: height * 0.07,
            // width: MediaQuery.of(context).size.width *
            //     0.99,
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Search(
              SeachController: SeachController,
              cubit: cubit,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              GestureDetector(
                onTap: () {
                  cubit.getDataSearch(SeachController.text.isEmpty
                      ? '0'
                      : SeachController.text);

                  print("search");
                },
                child: cubit.isLoad
                    ? SpinkitWave()
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: Icon(
                          Icons.search_rounded,
                          color: Color0,
                          size: 35,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
