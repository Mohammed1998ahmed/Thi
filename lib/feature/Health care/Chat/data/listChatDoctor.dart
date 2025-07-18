class ListChatsTrinnerModel {
  List<ChatList>? chatList;
  bool? status;

  ListChatsTrinnerModel({this.chatList, this.status});

  ListChatsTrinnerModel.fromJson(Map<String, dynamic> json) {
    if (json['chatList'] != null) {
      chatList = <ChatList>[];
      json['chatList'].forEach((v) {
        chatList!.add(new ChatList.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatList != null) {
      data['chatList'] = this.chatList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ChatList {
  int? doctorId;
  String? doctorName;
  String? doctorImage;
  String? sort;
  String? lastMessage;
  String? lastMessageTime;
  int? unreadMessages;
  List<int>? ids;

  ChatList(
      {this.doctorId,
      this.doctorName,
      this.doctorImage,
      this.sort,
      this.lastMessage,
      this.lastMessageTime,
      this.unreadMessages,
      this.ids});

  ChatList.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorImage = json['doctor_image'];
    sort = json['sort'];
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
    unreadMessages = json['unread_messages'];
    ids = json['ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['doctor_image'] = this.doctorImage;
    data['sort'] = this.sort;
    data['last_message'] = this.lastMessage;
    data['last_message_time'] = this.lastMessageTime;
    data['unread_messages'] = this.unreadMessages;
    data['ids'] = this.ids;
    return data;
  }
}
