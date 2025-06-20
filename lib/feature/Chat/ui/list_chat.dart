import 'package:flutter/material.dart';

import '../../../core/component/conset/Const.dart';
import '../../../core/widght/Widght.dart';
import '../chat.dart';
import '../logic/cubit/chat_cubit.dart';

ListTile list_chat(
    ChatCubit cubit, int index, double width, BuildContext context) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(ImagesPath +
          cubit.listChatsTrinnerModel!.chatList![index].trainerImage
              .toString()),
    ),
    title: text(
      title:
          cubit.listChatsTrinnerModel!.chatList![index].trainerName.toString(),
      fontSize: 16.0,
      color: Color.fromRGBO(0, 0, 0, 0.87),
      fontWeight: FontWeight.w600,
    ),
    subtitle: text(
      title:
          cubit.listChatsTrinnerModel!.chatList![index].lastMessage.toString(),
      fontSize: 15.0,
      color: Color.fromRGBO(0, 0, 0, 0.87),
      fontWeight: FontWeight.w400,
    ),
    trailing: Container(
      width: width * 0.13,
      child: cubit.listChatsTrinnerModel!.chatList![index].unreadMessages == 0
          ? Container(
              child: text(
                title: cubit
                    .listChatsTrinnerModel!.chatList![index].lastMessageTime
                    .toString(),
                fontSize: 12.0,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                color: Color.fromRGBO(0, 0, 0, 0.4),
                fontWeight: FontWeight.w400,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    text(
                      title: cubit.listChatsTrinnerModel!.chatList![index]
                          .lastMessageTime
                          .toString(),
                      fontSize: 12.0,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color0,
                        ),
                        child: text(
                          title: cubit.listChatsTrinnerModel!.chatList![index]
                              .unreadMessages
                              .toString(),
                          color: Colors.black,
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ],
            ),
    ),
    onTap: () {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ChatScreen(
            ID_Trinner: int.parse(cubit
                .listChatsTrinnerModel!.chatList![index].trainerId
                .toString()),
            FNameTrinner: cubit
                .listChatsTrinnerModel!.chatList![index].trainerName
                .toString(),
            ImageTrinner: cubit
                .listChatsTrinnerModel!.chatList![index].trainerImage
                .toString(),
            idChat: cubit.listChatsTrinnerModel!.chatList![index].ids,
          ),
        ),
      ); // Navigate to chat screen for selected conversation
    },
  );
}
