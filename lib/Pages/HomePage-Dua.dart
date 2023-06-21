import 'package:first_app/Pages/DuaAdkar.dart';
import 'package:first_app/Pages/MorningAdkar.dart';
import 'package:first_app/Pages/PrayDua.dart';
import 'package:first_app/Pages/SettingsPage.dart';
import 'package:first_app/Pages/SleepAdkar.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:first_app/Pages/NightAdkar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Providers.dart';
//import 'package:floor/floor.dart';

class Dua extends StatefulWidget {

  @override
  _DuaState createState() => _DuaState();
}

class _DuaState extends State<Dua> {


  Widget build(BuildContext context) {

    var sip = Provider.of<MyHomePageModel>(context);

    sip.getAllCounter();
    sip.getAll_CompletedCounter();
    sip.getSCounter();
    sip.getAllSCounter();
    sip.getPCounter();
    sip.getAllPCounter();
    sip.getNCounter();
    sip.getAllNCounter();
    sip.getMCounter();
    sip.getAllMCounter();
    sip.GetNotification();
    NotifyTime.GetMorningTime();
    NotifyTime.GetNightTime();
    NotifyTime.GetSleepTime();
    sip.GetFontSize();







    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colors.greenblue,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert,color: Colors.white,),
              onPressed: () {
                Dialog(context);
              })
        ],
      ),
      // endDrawer: drw(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            //  height: MediaQuery.of(context).size.height/6,
            // width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/decorations.png'),
                  fit: BoxFit.cover),
              // gradient: LinearGradient(
              //     colors: [color2, color1],
              //     stops: [0.1, 1]),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 4,
                  blurRadius: 2,
                )
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 50, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          child: Center(
                              child: (Text(' مجموع قراءتك للأذكار كاملة  ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900))))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('اذكار الصباح',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('اذكار المساء',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('اذكار النوم',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Text('${sip.getMCounter()}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                        child: Text('${sip.getNCounter()}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
                        child: Text('${sip.getSCounter()}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: NightDua(),
                                  type:
                                      PageTransitionType.leftToRightWithFade));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/moon-stars1.png"),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.20),
                                spreadRadius: 4,
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'اذكار المساء',
                                style: TextStyle(
                                    color: colors.greenblue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: MorningDua(),
                                  type:
                                      PageTransitionType.leftToRightWithFade));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/morning23.png"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.20),
                                    spreadRadius: 4,
                                    blurRadius: 15),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'اذكار الصباح',
                                style: TextStyle(
                                    color: colors.greenblue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: PrayDua(),
                                  type:
                                      PageTransitionType.leftToRightWithFade));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/pray2.png"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.17),
                                    spreadRadius: 4,
                                    blurRadius: 10),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'اذكار الصلاة',
                                style: TextStyle(
                                    color: colors.greenblue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: SleepDua(),
                                  type:
                                      PageTransitionType.leftToRightWithFade));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/_sleep-2.png"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.20),
                                    spreadRadius: 4,
                                    blurRadius: 15),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'اذكار النوم',
                                style: TextStyle(
                                    color: colors.greenblue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context, PageTransition(
                          //     duration: Duration(milliseconds: 300),
                          //     reverseDuration: Duration(milliseconds: 300),
                          //     child: DuaAdkar(), type: PageTransitionType.leftToRightWithFade));

                          Navigator.pushNamed(context, '/Dua');
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/Dua.png"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.20),
                                    spreadRadius: 4,
                                    blurRadius: 15),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'أدعية ',
                                style: TextStyle(
                                    color: colors.greenblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Subha');
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/Subha.png"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.20),
                                    spreadRadius: 4,
                                    blurRadius: 15),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'السبحة',
                                style: TextStyle(
                                    color: colors.greenblue,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
      // bottomNavigationBar: (btmbar()),
    );
  }

  String Dialog(BuildContext) {
    var alert = AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height/3,
        width:  MediaQuery.of(context).size.width/3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //نبذة عن التطبيق
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/AppInfo');
                          },
                          child: Text(
                            'نبذة عن التطبيق',
                            style: TextStyle(
                              color: colors.greenblue,
                            ),
                          ))),
                  Icon(
                    Icons.info,
                    color: colors.deepOrange,
                  ),
                ],
              ),
            ),
            Divider(),
            //الاحصائيات
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/Statistics');
                          },
                          child: Text(
                            'الإحصائيات',
                            style: TextStyle(
                              color: colors.greenblue,
                            ),
                          ))),
                  Icon(
                    Icons.bar_chart,
                    color: colors.deepOrange,
                  ),
                ],
              ),
            ),

           Divider(),
////======================Settings page===========================================================

            // Padding(
            //   padding: EdgeInsets.all(5),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           flex: 2,
            //           child: GestureDetector(
            //               onTap: () {
            //                 Navigator.pop(context);
            //                 Navigator.pushNamed(context, '/Settings');
            //               },
            //               child: Text(
            //                 'الإعدادات',
            //                 style: TextStyle(
            //                   color: colors.greenblue,
            //                 ),
            //               ))),
            //       Icon(
            //         Icons.settings,
            //         color: colors.deepOrange,
            //       ),
            //     ],
            //   ),
            // ),
            // Divider(),



          ],
        ),
      ),
    );
    showDialog(context: context, child: alert);
  }
}


Future<void>ShowMorningNotification()async{
  var AlarmTime=Time(int.parse(NotifyTime.MorningTime[0]),int.parse(NotifyTime.MorningTime[1]),0);
  var AndroidChannel=AndroidNotificationDetails(
    'channelId',
    'channelName',
    'channelDescription',
    importance: Importance.Max,
    playSound: true,
    //icon: 'notificationicon',
    // ledOnMs:5000,
    // styleInformation:Day.values
  );
  var iosChannel=IOSNotificationDetails();
  var platformChannel=NotificationDetails(AndroidChannel,iosChannel);
  await flutterLocalNotificationsPlugin.showDailyAtTime(
    0,
    'أذكار الصباح',
    'وقت قراءة أذكار الصباح',
    AlarmTime,
    // sechduleTime,
    platformChannel,
  );
}


Future<void>ShowNightNotification()async{
  var AlarmTime=Time(int.parse(NotifyTime.NightTime[0]),int.parse(NotifyTime.NightTime[1]),0);
  var AndroidChannel=AndroidNotificationDetails(
    'channelId',
    'channelName',
    'channelDescription',
    importance: Importance.Max,
    playSound: true,
    //icon: 'notificationicon',
    // ledOnMs:5000,
    // styleInformation:Day.values
  );
  var iosChannel=IOSNotificationDetails();
  var platformChannel=NotificationDetails(AndroidChannel,iosChannel);
  await flutterLocalNotificationsPlugin.showDailyAtTime(
    0,
    'أذكار المساء',
    'وقت قراءة أذكار المساء',
    AlarmTime,
    // sechduleTime,
    platformChannel,
  );
}

Future<void>ShowSleepNotification()async{
  var AlarmTime=Time(int.parse(NotifyTime.SleepTime[0]),int.parse(NotifyTime.SleepTime[1]),0);
  var AndroidChannel=AndroidNotificationDetails(
    'channelId',
    'channelName',
    'channelDescription',
    importance: Importance.Max,
    playSound: true,
    //icon: 'notificationicon',
    // ledOnMs:5000,
    // styleInformation:Day.values
  );
  var iosChannel=IOSNotificationDetails();
  var platformChannel=NotificationDetails(AndroidChannel,iosChannel);
  await flutterLocalNotificationsPlugin.showDailyAtTime(
    0,
    'أذكار النوم',
    'وقت قراءة أذكار النوم',
    AlarmTime,
    // sechduleTime,
    platformChannel,
  );
}