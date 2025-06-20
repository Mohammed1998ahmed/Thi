import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../sharePreferinces/shardprefericences.dart';

class FireBaseApp {
  final _firebaseMessages = FirebaseMessaging.instance;

  Future<void> initFirebaseNotifications() async {
    await _firebaseMessages.requestPermission();
    final fcmToken = await _firebaseMessages.getToken();
    CachShpreafapp.sevedata(key: "tokenDevice", value: fcmToken);
    print("Token: $fcmToken");

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Received message while app is in foreground:");
      print("Notification title: ${message.notification?.title}");
      print("Notification body: ${message.notification?.body}");
      // قم بتنفيذ الإجراءات الخاصة بك هنا عند استلام الرسالة أثناء تشغيل التطبيق
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Received message while app is in background:");
      print("Notification title: ${message.notification?.title}");
      print("Notification body: ${message.notification?.body}");

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: message.notification?.title ?? 'Notification',
          body: message.notification?.body ?? 'New message received',
          // استبدل برابط الصورة الخاصة بك

          bigPicture:
              'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
          largeIcon:
              'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
          notificationLayout: NotificationLayout.BigPicture,
        ),
      );
      // Add your custom actions here upon receiving the notification
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    // يمكنك هنا تنفيذ الإجراءات الخاصة بك عند استلام الرسالة أثناء عدم تشغيل التطبيق
  }
}
