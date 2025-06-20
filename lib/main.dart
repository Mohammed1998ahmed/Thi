///// *************** MOHAMMED AHMED SH ******************* /////

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:thi/core/NetWork/dioHelper.dart';
import 'package:flutter/services.dart';
import 'package:thi/core/configNotifaction/firebaseconfigeerr.dart';
import 'package:thi/core/configNotifaction/localNotifation.dart';

import 'package:thi/core/sharePreferinces/shardprefericences.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:thi/myApp.dart';
import 'core/BlocServic/Bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Center(child: Text("Not Found Internet"))),
    );
  };
  await dotenv.load(fileName: ".env");
  await CachShpreafapp.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  PusherChannelsFlutter();
  Stripe.publishableKey = dotenv.env["Stripe_Key"] ?? "";

  // 'pk_test_51OpWWDCxQy2AfPxb214C7lPGSOfgaEHjM3BGyrlntMc6RHMa2oaMcp3JuhaVXZxXYlUtlXBr1xpl10A3Kvckwath00hYwGapFK';
  AwesomeNotifications().initialize(
    'resource://drawable/rainbowcuate', // استبدل برمز الأيقونة الخاص بتطبيقك
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Basic notifications channel',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
  );

  await LocalNotifations.init();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseApp().initFirebaseNotifications();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
