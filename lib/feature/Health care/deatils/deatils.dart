import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:thi/feature/Health%20care/deatils/logic/cubit/details_health_cubit.dart';

import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/core/sharePreferinces/shardprefericences.dart';

import 'ui/appBar_widght.dart';
import 'ui/datails_v_widght.dart';
import 'ui/veterinarians_about_widght.dart';

// ignore: must_be_immutable
class HealthCenterDetailsScreen extends StatelessWidget {
  // ignore: unused_field
  int _selectedButton = 0;
  final int ID_helthCare;
  // ignore: unused_field
  List<bool> _isSelected = [true, false, false];

  Future<void> shareText({String? nameStable}) async {
    try {
      await FlutterShare.share(
          title: 'Share',
          text: nameStable ?? "Tlkjkljjjljlj HI",
          chooserTitle: "mohammed ahmed "
          // subject: "subject",
          );
    } catch (e) {
      print('Error sharing: $e');
    }
  }

  HealthCenterDetailsScreen({super.key, required this.ID_helthCare});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsHealthCubit()
        ..getHomeHelthCare(Id_Details: ID_helthCare)
        ..getallDoctors(Id_Details: ID_helthCare)
        ..getRatingID(
            Helth_id: ID_helthCare,
            Profile_id: CachShpreafapp.getdata(key: "ProfileID"))
        ..getDataGetAverageRevewModel(ID_helthCare)
        ..configurePusher1(Helth_id: ID_helthCare)
        ..configurePusherDoctors(Id_Health: ID_helthCare),
      child: BlocConsumer<DetailsHealthCubit, DetailsHealthState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = DetailsHealthCubit.getObject(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.46,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                        Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                        Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [],
                  ),
                  // color: Colors.yellow,
                  child: cubit.healthCaresByIDModel == null
                      ? Container()
                      : Stack(children: [
                          cubit.healthCaresByIDModel!.healthCare == null
                              ? Container()
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                    image: DecorationImage(
                                        image: NetworkImage(ImagesPath +
                                            cubit.healthCaresByIDModel!
                                                .healthCare!.profileImage
                                                .toString()),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                          Scaffold(
                            backgroundColor: Colors.transparent,
                            appBar: appBar_widght(context, cubit),
                            body: Column(children: [
                              Spacer(),
                              datails_v_widght(context, cubit)
                            ]),
                          )
                        ]),
                ),
                //////////////////////////
                veterinarians_about_widght(context, cubit,
                    ID_helthCare: ID_helthCare),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class HealthDoctor {
  late final String name;

  late final String imageUrl;

  HealthDoctor({
    required this.name,
    required this.imageUrl,
  });
}

GestureDetector ButtonBookandDirectionandShare(
    {required BuildContext context,
    void Function()? onTap,
    IconData? icon,
    required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white54,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Color0,
            child: Icon(
              icon ?? Icons.book,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        text(
            title: title,
            color: Color.fromRGBO(0, 0, 0, 0.54),
            fontSize: 16,
            fontWeight: FontWeight.w400)
      ],
    ),
  );
}
