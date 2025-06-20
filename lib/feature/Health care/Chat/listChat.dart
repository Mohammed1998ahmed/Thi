// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Health%20care/Chat/chat.dart';
import 'package:thi/feature/Health%20care/Chat/logic/cubit/chat_cubit.dart';
import 'package:thi/feature/Health%20care/Chat/logic/cubit/chat_state.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/shimmerWidght.dart';

class Conversation {
  final String name;
  final String message;
  final String image;
  final int unreadMessages;
  final DateTime messageTime; // حقل لتخزين وقت إرسال الرسالة

  Conversation({
    required this.name,
    required this.message,
    required this.image,
    required this.unreadMessages,
    required this.messageTime,
  });
}

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ChatCubit()..getLIstChatTrinner(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ChatCubit.getObject(context);

          return Scaffold(
              body: Container(
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageBackground), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: Container(),
                title: Center(
                  child: text(
                      title: "Messages",
                      color: Color.fromRGBO(90, 0, 114, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                // actions: [
                //   IconButton(
                //       onPressed: () {},
                //       icon: Icon(
                //         Icons.more_vert,
                //         color: Color.fromRGBO(90, 0, 114, 0.87),
                //       ))
                // ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/Chat-cuate.png",
                      width: width * 0.60,
                      height: height * 0.3,
                    ),
                    Divider(
                      color: Color.fromRGBO(138, 134, 139, 0.8),
                    ),
                    cubit.listChatsTrinnerModel == null
                        ? Container()
                        : Container(
                            width: width,
                            height: height * 0.46,
                            child: ListView.separated(
                              itemCount:
                                  cubit.listChatsTrinnerModel!.chatList == null
                                      ? 0
                                      : cubit.listChatsTrinnerModel!.chatList!
                                          .length,
                              separatorBuilder: (BuildContext, int) => Divider(
                                color: Color.fromRGBO(138, 134, 139, 0.8),
                              ),
                              itemBuilder: (context, index) {
                                return cubit.shimmer
                                    ? ShimmerWidght(
                                        width: width, height: height)
                                    : ListTile(
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              ImagesPath +
                                                  cubit
                                                      .listChatsTrinnerModel!
                                                      .chatList![index]
                                                      .doctorImage
                                                      .toString()),
                                        ),
                                        title: text(
                                          title: cubit.listChatsTrinnerModel!
                                              .chatList![index].doctorName
                                              .toString(),
                                          fontSize: 16.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.87),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        subtitle: text(
                                          title: cubit.listChatsTrinnerModel!
                                              .chatList![index].lastMessage
                                              .toString(),
                                          fontSize: 15.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.87),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        trailing: Container(
                                          width: width * 0.13,
                                          child: cubit
                                                      .listChatsTrinnerModel!
                                                      .chatList![index]
                                                      .unreadMessages ==
                                                  0
                                              ? Container(
                                                  child: text(
                                                    title: cubit
                                                        .listChatsTrinnerModel!
                                                        .chatList![index]
                                                        .lastMessageTime
                                                        .toString(),
                                                    fontSize: 12.0,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        text(
                                                          title: cubit
                                                              .listChatsTrinnerModel!
                                                              .chatList![index]
                                                              .lastMessageTime
                                                              .toString(),
                                                          fontSize: 12.0,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.4),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Color0,
                                                            ),
                                                            child: text(
                                                              title: cubit
                                                                  .listChatsTrinnerModel!
                                                                  .chatList![
                                                                      index]
                                                                  .unreadMessages
                                                                  .toString(),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.0,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                        ),
                                        onTap: () {
                                          print("mohamed");
                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  ChatScreen(
                                                ID_Doctor: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .doctorId!,
                                                FNameDoctor: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .doctorName!,
                                                ImageDoctor: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .doctorImage!,
                                                idChat: cubit
                                                    .listChatsTrinnerModel!
                                                    .chatList![index]
                                                    .ids,
                                              ),
                                            ),
                                          ); // Navigate to chat screen for selected conversation
                                        },
                                      );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
