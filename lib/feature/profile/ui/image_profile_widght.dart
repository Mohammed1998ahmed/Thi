import 'package:flutter/material.dart';

import '../../../core/component/conset/Const.dart';
import '../../../core/widght/Widght.dart';
import '../logic/cubit/profile_cubit.dart';
import 'profile2.dart';

Padding image_profile_widght(
    BuildContext context, ProfileCubit cubit, double Width, double Height) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(ImagesPath +
                                cubit.profileModel!.user!.profiles!.profile!),
                            fit: BoxFit.cover)),
                  ),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.23,
              child: HexagonImage(
                size: 100,
                imageUrl: ImagesPath +
                    cubit.profileModel!.user!.profiles!.profile.toString(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: Width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Width * 0.46,
              child: text(
                  title: cubit.profileModel!.user!.profiles!.fName!,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  color: Color0),
            ),
            SizedBox(
              height: Height * 0.01,
            ),
            Container(
              width: Width * 0.4,
              child: text(
                  title: cubit.profileModel!.user!.email!,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  fontWeight: FontWeight.w400,
                  color: Color7),
            ),
            SizedBox(
              height: Height * 0.02,
            ),
          ],
        ),
      ],
    ),
  );
}
