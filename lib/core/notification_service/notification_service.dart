// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shoghlana/core/app_router/navigate_services.dart';
// import 'package:shoghlana/core/constant/constants.dart';

// import '../shared_preferences/preference_helper.dart';

// class NotificationService {

//   FirebaseMessaging messaging = FirebaseMessaging.instance;


//   void requestAndRegisterNotification() async {
//     // Request permissions
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       carPlay: true,
//       criticalAlert: true,
//       badge: true,
//       provisional: true,
//       sound: true,
//     );

//     await messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     // ✅ ADD THIS FOR iOS - Get APNS Token
//     if (Platform.isIOS) {
//       String? apnsToken = await messaging.getAPNSToken();
//       if (apnsToken != null) {
//         print('APNS Token => $apnsToken');
//       }
//     }

//     messaging.getToken().then((value) {
//       deviceToken = value;
//       preferenceHelper.saveDataSharedPreference(key: 'myDeviceToken', value: deviceToken);
//       print('FCM Token is => $value');
//     });

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else {
//       print('User denied permission');
//     }
//   }

//   static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidInitialize = const AndroidInitializationSettings('ic_launcher');
//     var iOSInitialize = const DarwinInitializationSettings();
//     var initializationsSettings = InitializationSettings(
//         android: androidInitialize,
//         iOS: iOSInitialize
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//         initializationsSettings,
//         onDidReceiveNotificationResponse: (onDidReceiveNotificationResponse) {
//           print(onDidReceiveNotificationResponse.payload);
//         }
//     );
//   }

//   Future<void> firebaseNotificaitnInit(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     FirebaseMessaging.onMessage.listen(
//           (message) async {
//         RemoteNotification? notification = message.notification;
//         AndroidNotification? android = message.notification?.android;
//         AppleNotification? ios = message.notification?.apple;

//         AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//           android?.channelId ?? "high_importance_channel",
//           'High Importance Notifications',
//           enableVibration: true,
//           sound: RawResourceAndroidNotificationSound(android?.sound ?? ""),
//           importance: Importance.max,
//           priority: Priority.max,
//           color: Colors.white,
//         );

//         print("soundAndroid ${android?.sound ?? ""}");
//         print("soundIOS ${ios?.sound ?? ""}");

//         var not = NotificationDetails(
//           android: androidPlatformChannelSpecifics,
//           iOS: const DarwinNotificationDetails(),
//         );

//         if (Platform.isAndroid) {
//           await flutterLocalNotificationsPlugin.show(
//               notification.hashCode,
//               notification?.title,
//               notification?.body,
//               not
//           );
//         }
//       },
//     );

//     // ✅ ADD THIS - Handle notifications when app is terminated and user taps on it
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Message clicked!');
//       print(message.notification?.title);
//     });
//   }

//   Future<void> createChannel(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidNotificationChannel = const AndroidNotificationChannel(
//       "high_importance_channel",
//       "High Importance Notifications",
//       description: "High Importance Notifications",
//       importance: Importance.max,
//     );

//     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidNotificationChannel);
//   }
// }
