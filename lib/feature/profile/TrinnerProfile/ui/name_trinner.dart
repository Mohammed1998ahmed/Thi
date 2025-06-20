import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../../Chat/chat.dart';
import '../../../Reservations/Details_Club/data/TrinerIdByClub.dart';

Column name_trinner(BuildContext context,
    {required MyClubTrenerIDModel cubit, required int indexProfile}) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.03,
        child: text(
            title: cubit.trainers![indexProfile].fName.toString() +
                "  " +
                cubit.trainers![indexProfile].lName.toString(),
            fontSize: 20,
            // textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            fontWeight: FontWeight.w700,
            color: Color0),
      ),
      SizedBox(
        height: 2,
      ),
      text(
          title: "horse trainer",
          fontSize: 14,
          // textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(90, 0, 114, 1)),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Edit Chat
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ChatScreen(
                    ID_Trinner: cubit.trainers![indexProfile].id!,
                    FNameTrinner: cubit.trainers![indexProfile].fName!,
                    ImageTrinner: cubit.trainers![indexProfile].image!,
                  ),
                ),
              );
              print("llllll");
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Color0,
                  child: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                text(
                    title: "Chat",
                    color: Color.fromRGBO(0, 0, 0, 0.54),
                    fontSize: 13,
                    fontWeight: FontWeight.w400)
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
        ],
      ),
    ],
  );
}
