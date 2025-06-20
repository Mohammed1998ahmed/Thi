import 'package:flutter/material.dart';

import '../../../Reservations/Details_Club/ui/image_stack.dart';
import '../../../Reservations/Location/locationStabe.dart';
import '../../veternaty/verternaty.dart';
import '../deatils.dart';
import '../logic/cubit/details_health_cubit.dart';

Row datails_v_widght(BuildContext context, DetailsHealthCubit cubit) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ButtonBookandDirectionandShare(
          context: context,
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => VeterinaryConsultationScreen(
                  id_HelthCare: cubit.healthCaresByIDModel!.healthCare!.id!,
                  // Idcubit: Id,
                ),
              ),
            );
          },
          title: "verternaty",
          icon: Icons.vertical_shades),
      ButtonBookandDirectionandShare(
          context: context,
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => LocationStable(
                  latitude: double.parse(
                      cubit.healthCaresByIDModel!.healthCare!.lat!),
                  // 24.4539,
                  longitude: double.parse(
                      cubit.healthCaresByIDModel!.healthCare!.long!),
                  // 54.3773,
                ),
              ),
            );
          },
          title: "Direction",
          icon: Icons.location_on_outlined),
      ButtonBookandDirectionandShare(
          context: context,
          onTap: () {
            shareText(nameStable: "Direction");
          },
          title: "share",
          icon: Icons.share),
    ],
  );
}
