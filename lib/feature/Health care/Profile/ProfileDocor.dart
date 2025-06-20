import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thi/feature/Health%20care/Profile/logic/cubit/profile_dotors_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/appBar_widght.dart';
import 'ui/details_widght.dart';
import 'ui/image_doctor_widght.dart';

// ignore: must_be_immutable
class ProfileDoctor extends StatelessWidget {
  double rating = 0.0;
  final int ID_Doctor;

  ProfileDoctor({super.key, required this.ID_Doctor});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileDotorsCubit()..getallDoctors(Id_Doctor: ID_Doctor),
      child: BlocConsumer<ProfileDotorsCubit, ProfileDotorsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileDotorsCubit.getObject(context);
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  imageBackground,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: appBar_widght(context),
                  body: cubit.detailsByIdDoctorsModel == null
                      ? Container()
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                      color: Color0,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50))),
                                  child: Column(
                                    children: [
                                      image_doctor_widght(context, cubit),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                      ),
                                      details_widght(cubit, context,
                                          ID_Doctor: ID_Doctor),
                                      // Spacer()
                                    ],
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .004,
                              ),
                              Container(
                                height: 30,
                                // color: Colors.amber,
                                child: text(
                                    title: cubit.detailsByIdDoctorsModel!
                                        .doctor!.user!.email
                                        .toString(),
                                    color: Color0),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .003,
                              ),
                              Divider(
                                color: Color.fromRGBO(50, 52, 70, 1),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: text(
                                                    title: "Birth: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .birth
                                                      .toString(),
                                                  color: Color4),
                                            ),
                                            Expanded(
                                                child: text(
                                                    title: "Gender: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .gender
                                                      .toString(),
                                                  color: Color4),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: text(
                                                    title: "Experience: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                          .detailsByIdDoctorsModel!
                                                          .doctor!
                                                          .experience
                                                          .toString() +
                                                      " Years",
                                                  color: Color4),
                                            ),
                                            Expanded(
                                                child: text(
                                                    title: "Specialties: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .specialties
                                                      .toString(),
                                                  color: Color4),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: text(
                                                    title: "mobile: ",
                                                    color: Color0)),
                                            Expanded(
                                              child: text(
                                                  title: cubit
                                                      .detailsByIdDoctorsModel!
                                                      .doctor!
                                                      .user!
                                                      .mobile
                                                      .toString(),
                                                  color: Color4),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
