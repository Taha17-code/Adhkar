// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Bars.dart';
import 'Providers.dart';
//import 'FileNotifyManager.dart';
import 'package:first_app/Pages/FileNotifyManager.dart';
import 'HomePage-Dua.dart';




class Settings extends StatefulWidget {
 // const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  TimeOfDay time;
  TimeOfDay Ntime;
  TimeOfDay Stime;
  TimeOfDay picked;


  @override
  void initState(){

    super.initState();

    fileNotifyManager.setOnNotifictionRecieve(OnNotificationRecieve);
    fileNotifyManager.setOnNotificationClick(OnNotificationClick);
    time=(NotifyTime.MorningTime==null)?TimeOfDay.now():TimeOfDay(hour:int.parse(NotifyTime.MorningTime[0]) ,minute: int.parse(NotifyTime.MorningTime[1]) );
    Ntime=(NotifyTime.NightTime==null)?TimeOfDay.now():TimeOfDay(hour:int.parse(NotifyTime.NightTime[0]) ,minute: int.parse(NotifyTime.NightTime[1]) );
    Stime=(NotifyTime.SleepTime==null)?TimeOfDay.now():TimeOfDay(hour:int.parse(NotifyTime.SleepTime[0]) ,minute: int.parse(NotifyTime.SleepTime[1]) );

    // time=TimeOfDay.now();
    // Ntime=TimeOfDay.now();
    // Stime=TimeOfDay.now();

  }
  OnNotificationRecieve(ReseiveNotification notification){
    print("ReseiveNotification ${notification.id}");

  }
  OnNotificationClick(String payload){
    print("OnNotificationClick ${payload}");
  }

  void selectMTime(BuildContext context) async{
    picked=await showTimePicker(context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: time,
      confirmText: "تأكيد",
      cancelText: "إلغاء",
        helpText: "أذكار الصباح"
    );
    if(picked!=null && picked != time){

        time=picked;
        NotifyTime.SetMorningTime(time.hour.toString(), time.minute.toString());
        NotifyTime.GetMorningTime();
        // print(NotifyTime.MorningTime[0]+NotifyTime.MorningTime[1]);



    }

  }
  Future<Null>selectNTime(BuildContext context) async{
    picked=await showTimePicker(context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: Ntime,
        confirmText: "تأكيد",
        cancelText: "إلغاء",
        helpText: "أذكار المساء",

    );
    if(picked!=null && picked != Ntime){
      setState(() {
        Ntime=picked;
        NotifyTime.SetNightTime(Ntime.hour.toString(), Ntime.minute.toString());
        NotifyTime.GetNightTime();
      });

    }

  }
  Future<Null>selectSTime(BuildContext context) async{
    picked=await showTimePicker(context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: Stime,
        confirmText: "تأكيد",
        cancelText: "إلغاء",
        helpText: "أذكار النوم"
    );
    if(picked!=null && picked != Stime){
      setState(() {
        Stime=picked;

        NotifyTime.SetSleepTime(Stime.hour.toString(), Stime.minute.toString());
        NotifyTime.GetSleepTime();

      });

    }

  }

 // bool SwitchValue=false;

  @override

  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);
    void FontDialog(BuildContext context)async{

      var FontDialog=AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height/3,
          //width:  MediaQuery.of(context).size.width/2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(padding: const EdgeInsets.all(5),
                child: GestureDetector(
                    onTap: (){
                      sip.SetFontSize(15);
                      sip.GetFontSize();
                      Navigator.pop(context);
                    },
                    child: Row(

                      children: [
                        
                        Expanded(child: Center(child: Text('15 px',style: TextStyle(color: colors.lghtblue,fontWeight:FontWeight.w900),))),
                      ],
                    )),),
              Divider(),
              Padding(padding: const EdgeInsets.all(5),
                child: GestureDetector(

                    onTap: (){

                      sip.SetFontSize(20);
                      sip.GetFontSize();
                      Navigator.pop(context); 
                    },
                    child: Row(

                      children: [
                        Expanded(child: Center(child: Text('20 px',style: TextStyle(color: colors.lghtblue,fontWeight:FontWeight.w900),))),
                      ],
                    )),),
              Divider(),
              Padding(padding: const EdgeInsets.all(5),
                child: GestureDetector(
                    onTap: (){

                      sip.SetFontSize(25);
                      sip.GetFontSize();
                      Navigator.pop(context); 
                    },
                    child: Row(

                      children: [
                        Expanded(child: Center(child: Text('25 px',style: TextStyle(color: colors.lghtblue,fontWeight:FontWeight.w900),))),
                      ],
                    )),),

              Divider(),
              Padding(padding: const EdgeInsets.all(5),
                child: GestureDetector(
                    onTap: (){

                      sip.SetFontSize(30);
                      sip.GetFontSize();
                      Navigator.pop(context);
                    },
                    child: Row(

                      children: [
                        Expanded(child: Center(child: Text('30 px',style: TextStyle(color: colors.lghtblue,fontWeight:FontWeight.w900),))),
                      ],
                    )),),
            ],
          ),
        ),
      );
      showDialog(context: context, child: FontDialog);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //to remove a default (->) arrow back


        title: Center(child: Text('الإعدادات ')),backgroundColor: colors.greenblue,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
            ),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Home', (Route<dynamic> route) => false);
              });

            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(

            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Switch
                  ( value:sip.Notification,
                  activeColor: colors.lightOrange,


                  onChanged:(v)async {

                  //  v!=v;
                    //print(v);
                    sip.Notification=v;
                 sip.SetNotification(v);
                 sip.GetNotification();
                    print(sip.Notification);

                    //SwitchValue=v;
                    //

                      if(sip.Notification==true){  await ShowMorningNotification();
                      await ShowNightNotification();
                      await ShowSleepNotification();
                      }

                  },),
                  Expanded(

                    child: Text('تفعيل إشعارات الأذكار',style: TextStyle(color:colors.greenblue,fontSize: 18,fontWeight: FontWeight.bold),textDirection:TextDirection.rtl,),
                  )

                ],
              ),
              Divider(),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                Text(' ${time.hour<12 ?'ص':'م'}  ${int.parse(NotifyTime.MorningTime[0])>12?int.parse(NotifyTime.MorningTime[0])-12:NotifyTime.MorningTime[0]}:${NotifyTime.MorningTime[1] } ',style: TextStyle(color: colors.lghtblue,fontSize:18,),),
                  Expanded(child: GestureDetector(
                    onTap: (){


                        selectMTime(context);

                                setState(() {

                                });



                    },
                    child: Text('وقت إشعار أذكار الصباح',
                      style: TextStyle(color: colors.lightOrange2,fontSize:15,fontWeight: FontWeight.normal),textDirection: TextDirection.rtl,),
                  )),

                ],),
              ),


              Divider(),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(' ${Ntime.hour<12 ?'ص':'م'}  ${int.parse(NotifyTime.NightTime[0])>12?int.parse(NotifyTime.NightTime[0])-12:NotifyTime.NightTime[0]}:${NotifyTime.NightTime[1] } ',style: TextStyle(color: colors.lghtblue,fontSize:18,),),
                    Expanded(child: GestureDetector(
                      onTap: ()async{
                        selectNTime(context);

                      },
                      child: Text('وقت إشعار أذكار المساء',
                        style: TextStyle(color: colors.lightOrange2,fontSize:15,fontWeight: FontWeight.normal),textDirection: TextDirection.rtl,),
                    )),
                  ],),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(' ${Stime.hour<12 ?'ص':'م'}  ${int.parse(NotifyTime.SleepTime[0])>12?int.parse(NotifyTime.SleepTime[0])-12:NotifyTime.SleepTime[0]}:${NotifyTime.SleepTime[1] } ',style: TextStyle(color: colors.lghtblue,fontSize:18,),),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        selectSTime(context);
                      },
                      child: Text('وقت إشعار أذكار النوم',
                        style: TextStyle(color: colors.lightOrange2,fontSize:15,fontWeight: FontWeight.normal),textDirection: TextDirection.rtl,),
                    )),
                  ],),
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //Text(' ${Stime.hour<12 ?'ص':'م'}  ${int.parse(NotifyTime.SleepTime[0])>12?int.parse(NotifyTime.SleepTime[0])-12:NotifyTime.SleepTime[0]}:${NotifyTime.SleepTime[1] } ',style: TextStyle(color: colors.lghtblue,fontSize:18,),),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        FontDialog(context);
                      },
                      child: Text('حجم خط الأذكار',
                        style: TextStyle(color: colors.greenblue,fontSize:18,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                    )),
                  ],),
              ),





            ],
          ),
        ),
      ),

    );

  }

}



class NotifyTime extends ChangeNotifier{

  //=========================MorningNotificationTime======================================
  static  List MorningTime=[];

 static void SetMorningTime(String hour,String minute)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setStringList('MorningTime', [hour,minute]);

  }


  static  void GetMorningTime()async{
    SharedPreferences pref=await SharedPreferences.getInstance();


    MorningTime=pref.getStringList('MorningTime')??["5","00"];


  }


  //=========================NightNotificationTime======================================
  static  List NightTime=[];

  static void SetNightTime(String hour,String minute)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setStringList('NightTime', [hour,minute]);

  }


  static  void GetNightTime()async{
    SharedPreferences pref=await SharedPreferences.getInstance();


    NightTime=pref.getStringList('NightTime')??["7","00"];


  }


  //=========================SleepNotificationTime======================================
  static  List SleepTime=[];

  static void SetSleepTime(String hour,String minute)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setStringList('SleepTime', [hour,minute]);

  }


  static  void GetSleepTime()async{
    SharedPreferences pref=await SharedPreferences.getInstance();


    SleepTime=pref.getStringList('SleepTime')??["10","00"];


  }



}

