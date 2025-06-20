import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../Chat/chat.dart';
import '../logic/cubit/profile_dotors_cubit.dart';

Column details_widght(ProfileDotorsCubit cubit, BuildContext context,
    {required int ID_Doctor}) {
  return Column(
    children: [
      text(
          title:
              "Dr. ${cubit.detailsByIdDoctorsModel!.doctor!.firstName.toString() + " " + cubit.detailsByIdDoctorsModel!.doctor!.lastName.toString()}",
          fontSize: 18,
          // textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          color: Color3),
      SizedBox(
        height: 2,
      ),
      text(
          title: cubit.detailsByIdDoctorsModel!.doctor!.description.toString(),
          fontSize: 14,
          // textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(252, 249, 252, 1)),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print("llllll");
            },
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // ChatScreen
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ChatScreen(
                          ID_Doctor: ID_Doctor,
                          ImageDoctor:
                              cubit.detailsByIdDoctorsModel!.doctor!.image!,
                          FNameDoctor:
                              cubit.detailsByIdDoctorsModel!.doctor!.firstName!,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Color4,
                    child: Icon(
                      Icons.chat_bubble,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                text(
                    title: "Chat",
                    color: Color3,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
