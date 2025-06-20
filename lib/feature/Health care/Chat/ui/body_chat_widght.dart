import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/chat_cubit.dart';

Padding body_chat_widght(ChatCubit cubit, int index, BuildContext context,
    {required String ImageDoctor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: cubit.chatModelGetData!.chats![index].user == 1
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        cubit.chatModelGetData!.chats![index].user == 1
            ? Container()
            : CircleAvatar(
                backgroundImage: NetworkImage(ImagesPath + ImageDoctor),
              ),
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: cubit.chatModelGetData!.chats![index].user == 1
                ? Color0
                : Color.fromRGBO(50, 52, 70, 0.85),
            borderRadius: cubit.chatModelGetData!.chats![index].user == 1
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: cubit.chatModelGetData!.chats![index].user == 1
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              cubit.chatModelGetData!.chats![index].image != null
                  ? GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: Image.network(
                                  ImagesPath +
                                      cubit
                                          .chatModelGetData!.chats![index].image
                                          .toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.network(
                          ImagesPath +
                              cubit.chatModelGetData!.chats![index].image
                                  .toString(), // تمرير مسار الصورة المحددة هنا
                          fit: BoxFit.cover, // اختيار تناسب الصورة في العرض
                        ),
                      ),
                    )
                  : Container(),
              cubit.chatModelGetData!.chats![index].content == null
                  ? Container()
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: text(
                        title: cubit.chatModelGetData!.chats![index].content
                            .toString(),
                        fontSize: 14.0,
                        color: cubit.chatModelGetData!.chats![index].user == 1
                            ? Color.fromRGBO(33, 35, 39, 1)
                            : Color(0xDDFFFFFF),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment:
                    cubit.chatModelGetData!.chats![index].user == 1
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                children: [
                  cubit.chatModelGetData!.chats![index].time == null
                      ? Container()
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: text(
                            title: cubit.chatModelGetData!.chats![index].time
                                .toString(),
                            fontSize: 14.0,
                            color:
                                cubit.chatModelGetData!.chats![index].user == 1
                                    ? Color.fromRGBO(33, 35, 39, 1)
                                    : Color(0xDDFFFFFF),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  SizedBox(width: 4.0),
                  if (cubit.chatModelGetData!.chats![index].user == 1)
                    Icon(
                      cubit.chatModelGetData!.chats![index].user == 1
                          ? Icons.done_all
                          : Icons.done,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
