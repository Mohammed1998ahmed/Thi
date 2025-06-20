import 'dart:io';

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
