import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/repositories/task_repository.dart';

class TaskNotificationController extends GetxController {
  final taskRepository = Get.put(TaskRepository());

  static TaskNotificationController get instance => Get.find();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    String messageTitle = message.notification!.title.toString();
    String messageBody = message.notification!.body.toString();
    String data = message.data.toString();

    // navigate to task details page
  }

  // Initialize notifications
  Future<void> initNotification() async {
    // request permission from user
    await _firebaseMessaging.requestPermission();

    // Fetch FCM token for the device
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token: $fcmToken');

    // initialize settings for push notifications
    initPushNotifications();
  }

  // Initialize background notifications
  Future<void> initPushNotifications() async {
    // handle notification if the app was terminated
    _firebaseMessaging.getInitialMessage().then(handleMessage);

    // attach event listeners when notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
