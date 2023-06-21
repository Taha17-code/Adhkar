import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

import 'dart:io'show Platform;


class FileNotifyManager{

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  var initSettings;
BehaviorSubject<ReseiveNotification> get didReceivelocalNotificationSubject=>
BehaviorSubject<ReseiveNotification>();

  FileNotifyManager.init(){
    flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
    if(Platform.isIOS){
      requestIOSPermission();
    }
    initializePlatform();
  }
  requestIOSPermission(){

  }
  initializePlatform(){

   var initSettingAndroid=AndroidInitializationSettings('notificationicon');

   var initSettingIOS=IOSInitializationSettings(
     requestSoundPermission: true,
     requestBadgePermission: true,
     requestAlertPermission: true,
     onDidReceiveLocalNotification: (id,title,body,plaload)async{
  ReseiveNotification notification=
  ReseiveNotification(id: id, title: title, body: body, playload: plaload);

  didReceivelocalNotificationSubject.add(notification);

     }
   );
   initSettings=InitializationSettings(initSettingAndroid, initSettingIOS);

  }

  setOnNotifictionRecieve(Function OnNotificationRecieve){

    didReceivelocalNotificationSubject.listen((notification) {
      OnNotificationRecieve(notification);
    });
  }
  setOnNotificationClick(Function OnNotificationClick)async{
    await flutterLocalNotificationsPlugin.initialize(initSettings,
    onSelectNotification: (String payload)async{
      OnNotificationClick(payload);
    });

  }

  Future<void>ShowNotification()async{
    var AndroidChannel=AndroidNotificationDetails(
        'channelId',
        'channelName',
        'channelDescription',
        importance: Importance.Max,
        priority: Priority.High,
        playSound: true,
    );
    var iosChannel=IOSNotificationDetails();
    var platformChannel=NotificationDetails(AndroidChannel,iosChannel);
    await flutterLocalNotificationsPlugin.show(
        0,
        'title',
        'body',
        platformChannel,
    payload: 'ckj');
  }

}
FileNotifyManager fileNotifyManager=FileNotifyManager.init();


class ReseiveNotification{
  final int id;
  final String title;
  final String body;
  final String playload;

  ReseiveNotification({@required this.id,@required this.title,@required this.body,@required this.playload});
}
