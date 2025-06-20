import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/BookingandAppointment/selectTepyBooking.dart';
import 'package:thi/feature/profile/EditProfile/EditProfile.dart';
import 'package:thi/feature/profile/changePassword/changePassWord.dart';
import 'package:thi/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:thi/feature/profile/favovoriteIstable/favovrite.dart';
import 'package:thi/feature/profile/hospetel/hospatel.dart';

import 'AboutAs/aboutas.dart';
import 'AuctionUserID/selectAuctions.dart';
import 'ui/ButtonProfile.dart';
import 'ui/image_profile_widght.dart';
import 'ui/profile2.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ProfileCubit()..getprofile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileCubit.getObject(context);

          return Scaffold(
              backgroundColor: Colors.transparent,
              body: state is ProfileSuecussfulyProfile
                  ? Container(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: Height * 0.02,
                          ),
                          image_profile_widght(context, cubit, Width, Height),
                          SizedBox(
                            height: Height * 0.03,
                          ),
                          ButtonStaic(
                            context: context,
                            radius: 5,
                            onTap: (() {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      EditProfile(
                                    profileModel: cubit.profileModel,
                                    image: cubit
                                        .profileModel!.user!.profiles!.profile,
                                  ),
                                ),
                              );
                            }),
                            title: "Edit profile",
                          ),
                          SizedBox(
                            height: Height * 0.05,
                          ),
                          Divider(
                            color: Color.fromRGBO(113, 104, 116, 0.8),
                            thickness: 3,
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            icon: Icons.book,
                            title: "Booking Order & Appointments ",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      SelectTypeBooking(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Favourite Istable",
                            icon: Icons.favorite_border,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      FaovoaitrIstable(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            icon: Icons.book,
                            title: "Auctions",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      SelectTypeAuction(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Consultation HealthCare",
                            icon: Icons.local_hospital,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Hostitel(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Change Password",
                            icon: Icons.password_outlined,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ChangPasswordProfileApp(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "About Us",
                            icon: Icons.info,
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => About_As(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          ButtonProfile(
                            Height: Height,
                            Width: Width,
                            context: context,
                            title: "Log out",
                            icon: Icons.logout,
                            onPressed: () {
                              cubit.logOut(context);
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 17.5, right: 10),
                            child:
                                Divider(color: Color.fromRGBO(50, 52, 70, 1)),
                          ),
                          SizedBox(
                            height: Height * 0.04,
                          )
                        ]),
                      ),
                    )
                  : SpinkitWave());
        },
      ),
    );
  }
}
