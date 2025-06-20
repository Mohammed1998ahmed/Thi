import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../Details_Club/cubit/home_stable_cubit.dart';

Container images(BuildContext context, {required HomeStableCubit cubit}) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.clubIDModel!.images!.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: NetworkImage(ImagesPath +
                            cubit.clubIDModel!.images![index].toString()
                        // 'assets/images/main/image ${index + 70}.png',
                        ),
                    fit: BoxFit.cover)),
          );
        },
      ));
}
