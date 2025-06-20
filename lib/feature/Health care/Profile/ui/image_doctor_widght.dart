import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../logic/cubit/profile_dotors_cubit.dart';

Center image_doctor_widght(BuildContext context, ProfileDotorsCubit cubit) {
  return Center(
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.antiAlias,
            // radius: 56,
            // backgroundColor: Colors.transparent,
            child: Image.network(
              ImagesPath +
                  cubit.detailsByIdDoctorsModel!.doctor!.image.toString(),
              fit: BoxFit.cover,
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        CircleAvatar(
          radius: 13,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.green,
        ),
      ],
    ),
  );
}
