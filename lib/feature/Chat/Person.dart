// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Chat/logic/cubit/chat_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/list_chat.dart';

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
  final List<Conversation> conversations = [
    Conversation(
      name: 'Mohammed Ahmed',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/Person.jpg',
      unreadMessages: 70,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Dino Waelchi',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/james-person-1.jpg',
      unreadMessages: 40,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Dino Waelchi',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/james-person-1.jpg',
      unreadMessages: 40,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Dino Waelchi',
      message: 'Can I book Jumping Package offer?',
      image: 'assets/images/james-person-1.jpg',
      unreadMessages: 40,
      messageTime:
          DateTime(2023, 10, 19, 10, 30), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Daniel William',
      message: 'Hey!',
      image: 'assets/images/Person.jpg',
      unreadMessages: 30,
      messageTime:
          DateTime(2023, 10, 18, 14, 45), // تعيين وقت إرسال الرسالة هنا
    ),
    Conversation(
      name: 'Victor Black',
      message: 'Which kind of package & offers provide?',
      image: 'assets/images/unnamed.jpg',
      unreadMessages: 20,
      messageTime:
          DateTime(2023, 10, 18, 14, 45), // تعيين وقت إرسال الرسالة هنا
    ),

    // Add more conversations as needed
  ];

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
              backgroundColor: Colors.transparent,
              body: Container(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage(imageBackground), fit: BoxFit.cover)),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: Container(),
                    title: Center(
                      child: text(
                          title: "Messages",
                          color: Color0,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
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
                                      cubit.listChatsTrinnerModel!.chatList ==
                                              null
                                          ? 0
                                          : cubit.listChatsTrinnerModel!
                                              .chatList!.length,
                                  separatorBuilder: (BuildContext, int) =>
                                      Divider(
                                    color: Color.fromRGBO(138, 134, 139, 0.8),
                                  ),
                                  itemBuilder: (context, index) {
                                    // final conversation = conversations[index];
                                    return cubit.shimmer
                                        ? ShimmerWidght(
                                            width: width, height: height)
                                        : list_chat(
                                            cubit, index, width, context);
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

class ShimmerWidght extends StatelessWidget {
  const ShimmerWidght({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimerWidght(
        width: width * 0.16,
        height: height * 0.2,
        reduis: 50,
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 30, bottom: 6),
        child: ShimerWidght(
          width: width * 0.02,
          height: height * 0.03,
        ),
      ),
      subtitle: ShimerWidght(
        width: width * 0.02,
        height: height * 0.03,
      ),
      trailing: Column(
        children: [
          ShimerWidght(
            width: width * 0.14,
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.004,
          ),
          ShimerWidght(
            width: width * 0.09,
            height: height * 0.04,
            reduis: 50,
          ),
        ],
      ),
    );
  }
}
