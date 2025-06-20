import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:thi/feature/Health%20care/Chat/logic/cubit/chat_cubit.dart';
import 'package:thi/feature/Health%20care/Chat/logic/cubit/chat_state.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/core/mPusherConig/piusherConfig.dart';

import '../../../core/NetWork/dioHelper.dart';
import '../../../core/sharePreferinces/shardprefericences.dart';
import 'ui/body_chat_widght.dart';

class ChatScreen extends StatefulWidget {
  final int ID_Doctor;
  final String FNameDoctor;
  // final String LNameTrinner;
  final List<int>? idChat;

  final String ImageDoctor;

  const ChatScreen({
    super.key,
    required this.ID_Doctor,
    required this.ImageDoctor,
    required this.FNameDoctor,
    this.idChat,
  });
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        sender: 'User',
        text: 'Hellovv',
        time: DateTime.now(),
        isDelivered: true),
    Message(
        sender: 'Friend',
        text: 'Hi there!',
        time: DateTime.now(),
        isDelivered: false),
  ];
  File? imageFile;
  final picker = ImagePicker();
  TextEditingController _textEditingController = TextEditingController();
  String? pickedFile; // تحديد المتغير العالمي

  // ignore: unused_element
  void _sendMessage() {
    if (_textEditingController.text.isEmpty && imageFile == null) return;

    setState(() {
      messages.add(
        Message(
          sender: 'User',
          text: _textEditingController.text,
          time: DateTime.now(),
          imageFile: imageFile,
          isDelivered: true,
        ),
      );

      _textEditingController.clear();
      imageFile = null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()
        ..getDataMessage(
            User_Id: CachShpreafapp.getdata(key: "UserID"),
            ID_Doctor: widget.ID_Doctor)
        ..configurePusher(ID_Doctor: widget.ID_Doctor),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is ChatGetSceccfully) {
            if (widget.idChat != null && widget.idChat!.length > 0) {
              for (int i = 0; i < widget.idChat!.length; i++) {
                ChatCubit.getObject(context)
                    .getLIstChatReadisModel(id: widget.idChat![i]);
              }
            }
          }
        },
        builder: (context, state) {
          final cubit = ChatCubit.getObject(context);

          return Scaffold(
            body: Stack(children: [
              Image.asset(
                imageBackground,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Color0),
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: text(
                            title: "${widget.FNameDoctor}",
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color0,
                          ),
                        )
                      ]),
                  actions: [
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: cubit.chatModelGetData == null
                          ? Center(child: SpinkitWave())
                          : ListView.builder(
                              controller: cubit.scrollController,
                              itemCount: cubit.chatModelGetData!.chats!.length,
                              itemBuilder: (BuildContext context, int index) {
                                // Message message = messages[index];
                                // bool isUser = message.sender == 'User';

                                return body_chat_widght(cubit, index, context,
                                    ImageDoctor: widget.ImageDoctor);
                              },
                            ),
                    ),
                    text_from_field_widght(cubit),
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }

  Container text_from_field_widght(ChatCubit cubit) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.attach_file,
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
              onPressed: () {
                _pickImage();
              }),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions,
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
            onPressed: () {
              // إضافة الكود الخاص بإظهار رموز التعبيرية (الإيموجي)
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 35, 39, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _textEditingController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: '   Write a comment…',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(142, 142, 147, 1),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Color.fromRGBO(225, 204, 232, 1),
            ),
            onPressed: () {
              if (_textEditingController.text.isEmpty && imageFile == null)
                return;
              cubit.postMessage(
                  user_id: CachShpreafapp.getdata(key: "UserID"),
                  doctor_id: widget.ID_Doctor,
                  content: _textEditingController.text,
                  imageFile: imageFile);
              setState(() {
                messages.add(
                  Message(
                    sender: 'User',
                    text: _textEditingController.text,
                    time: DateTime.now(),
                    imageFile: imageFile,
                    isDelivered: true,
                  ),
                );

                _textEditingController.clear();
                imageFile = null;
              });
            },
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final File? imageFile;

  final DateTime time;
  final bool isDelivered;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    this.imageFile,
    this.isDelivered = false,
  });
}

void configurePusher(ChatCubit chatCubit) async {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  // pusher.connectionState.
  try {
    // app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"
    await pusher.init(
      apiKey: "e5d6ede1b86a447371cc",
      cluster: "eu",
      useTLS: true,
      // authEndpoint: "https://192.168.109.241:8000/api/pusher/authenticate",
      onEvent: (event) {
        print(event.data.toString());
        chatCubit.pusherMessage.add(event.data);
      },
      // onError: (String moh, int? id, dynamic inmess) {
      //   print(moh + id.toString() + inmess.toString());
      // },
      // authEndpoint: ,
      // authParams: ,
      // useTLS: true,
      onConnectionStateChange: onConnectionStateChange,
      onError: onError,
      onSubscriptionSucceeded: onSubscriptionSucceeded,
      // onEvent: onEvent,
      onSubscriptionError: onSubscriptionError,
      onDecryptionFailure: onDecryptionFailure,
      onMemberAdded: onMemberAdded,
      onMemberRemoved: onMemberRemoved,

      onAuthorizer: onAuthorizer1,
    );
    await pusher.subscribe(
        channelName: "private-private.chat1-1", onEvent: onEvent1);
// await pusher.trigger(onEvent: onEvent1);

    // await pusher.onev
    await pusher.connect();
  } catch (e) {
    print("ERROR: $e" + e.toString());
  }
}

// app_id = "1793069" key = "e5d6ede1b86a447371cc" secret = "46834166895d119dc392" cluster = "eu"

dynamic onAuthorizer1(
    String channelName, String socketId, dynamic options) async {
  // socketId = "180192.65836375";

  // channelName = "private-private.chat2-1";
  print('////onAuthorizer' + socketId + channelName);

////////////////////////
  try {
    FormData formData = FormData.fromMap({
      "socketId": socketId,
      "channelName": channelName,
    });
    // String token = await CachShpreafapp.getdata(key: "tokenProfile");
    final response = await DioHelper.dio!.post(
      "pusher/authenticate",
      data: formData,
    );

    var json = jsonDecode(response.data);
    print(json.toString() +
        "(((((((((((((((((((((((((99999999999)))))))))))))))))))))))))");
    return json;
  } catch (e) {
    print(e.toString());
    print(
        "LLLLLLLfgfgfgfggggggggggggggggggggLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
    rethrow;
  }
}
