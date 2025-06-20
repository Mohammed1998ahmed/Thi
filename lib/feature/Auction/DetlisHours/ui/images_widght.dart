import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../logic/cubit/detlis_hours_cubit.dart';

Container images_widght(double height, double width, DetlisHoursCubit cubit) {
  return Container(
    height: height * .3,
    width: width,
    child: CarouselSlider(
      options: CarouselOptions(
        reverse: true,
        height: height * .3,
        autoPlay: true,
        aspectRatio: 3,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          // setState(() {
          cubit.chaingIndexImageAppBar(index);
          // currentIndex = index;
          print(cubit.currentIndex.toString());
          // });
        },
      ),
      items: cubit.detailsActionsID!.auction!.horses!.images!
          .map((image) => Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  ImagesPath + image,
                  height: height * .3,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ))
          .toList(),
    ),
  );
}
