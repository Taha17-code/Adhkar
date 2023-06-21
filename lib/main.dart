import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/Pages/DuaAdkar.dart';
import 'package:first_app/Pages/FileNotifyManager.dart';
import 'package:first_app/Pages/FinishRead.dart';
import 'package:first_app/Pages/HomePage-Dua.dart';
import 'package:first_app/Pages/More.dart';
import 'package:first_app/Pages/MorningAdkar.dart';
import 'package:first_app/Pages/NightAdkar.dart';
import 'package:first_app/Pages/PrayDua.dart';
import 'package:first_app/Pages/SleepAdkar.dart';
import 'package:first_app/Pages/Subha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Pages/AppInfo.dart';
import 'Pages/Providers.dart';
import 'Pages/SettingsPage.dart';
import 'Pages/Statistics.dart';
import 'Pages/AddDua.dart';
//import 'FileNotifyManager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:first_app/Pages/FileNotifyManager.dart';


List Adkar;
SharedPreferences prefs;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyHomePageModel()),
        ChangeNotifierProvider(create: (_) => DuaPass()),
      ],child: MyApp(),),);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

fileNotifyManager.setOnNotifictionRecieve(OnNotificationRecieve);
fileNotifyManager.setOnNotificationClick(OnNotificationClick);

    // final fbm = FirebaseMessaging();
    //
    // fbm.requestNotificationPermissions();
    // fbm.configure(
    //   onMessage: (msg) {
    //     print(msg);
    //     return;
    //   },
    // );
    //
    // fbm.configure(
    //   onResume: (msg) {
    //     print(msg);
    //     return;
    //   },
    // );
    //
    // fbm.configure(
    //   onLaunch: (msg) {
    //     print(msg);
    //     return;
    //   },
    // );
  }
  OnNotificationRecieve(ReseiveNotification notification){
    print("ReseiveNotification ${notification.id}");

  }
  OnNotificationClick(String payload){
    print("OnNotificationClick ${payload}");
  }

  // Add code after super
  @override
  var bkcolor = const Color(0XFFeae8e8);

  @override
  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);

    return MaterialApp(

          debugShowCheckedModeBanner: false,
          routes: {
            '/NightDua': (context) => NightDua(),
            '/Home': (context) => Dua(),
            '/MorningtDua': (context) => MorningDua(),
            '/PrayDua': (_) => PrayDua(),
            '/SleepDua': (_) => SleepDua(),
            '/DuaAdkar': (_) => DuaAdkar(),
            '/Finish': (_) => Finish(),
            '/Statistics': (_) => Statistics(),
            '/Dua': (_) => DuaAdkar(),
            '/Tasbeeh': (_) => Tasbeeh(),
            '/Subha': (_) => Subha(),
            '/addDua': (_) => addDua(),
            '/AppInfo': (_) => AppInfo(),
            '/Settings': (_) => Settings(),
          },
          title: 'للذاكرين',
          theme: ThemeData(

              // primarySwatch: colors.greenblue,
              // accentColor:colors.lightOrange,
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                dayPeriodColor: Colors.white,
                dayPeriodTextColor: colors.greenblue,
                dayPeriodBorderSide:BorderSide(color: colors.greenblue) ,


                dialTextColor:colors.lghtblue,
               // hourMinuteColor: colors.lightOrange2,
                dialHandColor:colors.lightOrange,
                hourMinuteTextColor: colors.lghtblue,
             //  entryModeIconColor: colors.lghtblue,
            //  inputDecorationTheme: InputDecorationTheme(fillColor: Colors.white,),
              //  dayPeriodTextStyle: TextStyle(color: colors.lghtblue),
              //  dialBackgroundColor: Colors.greenAccent,




                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                hourMinuteShape: CircleBorder(),
              ),
              fontFamily: 'Kufyan',

              // outlinedButtonTheme: OutlinedButtonThemeData(
              //     style:
              //         OutlinedButton.styleFrom(primary: colors.lightOrange))
                   ),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                child: SplashScreen(
                  image: Image.asset('assets/images/logo.png'),
                  title: Text(
                    'للذاكرين والذاكرات',
                    style: TextStyle(
                      color: colors.greenblue,
                      fontFamily: 'Kufyan',
                      fontSize: 20,
                    ),
                  ),
                  seconds: 2,
                  photoSize: 100,
                  navigateAfterSeconds: Dua(),
                  useLoader: false

                ),
              ),
            ),
          ),
        );
  }
}
