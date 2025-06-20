import 'package:flutter/material.dart';
import 'package:thi/feature/profile/TrinnerProfile/profile.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../cubit/home_stable_cubit.dart';

Container specialists(BuildContext context, HomeStableCubit cubit) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.1719999,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: cubit.myClubTrenerIDModel != null
          ? cubit.myClubTrenerIDModel!.trainers!.length
          : 0,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.03,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListCirclePerson(
            context: context,
            ImageNetWork: ImagesPath +
                cubit.myClubTrenerIDModel!.trainers![index].image.toString(),
            indexImage: index,
            title: cubit.myClubTrenerIDModel!.trainers![index].fName.toString(),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Profile(
                    Id_trinner: cubit.myClubTrenerIDModel!.trainers![index].id!,
                    cubit: cubit.myClubTrenerIDModel!,
                    indexProfile: index,
                  ),
                ),
              );
            });
      },
    ),
  );
}
