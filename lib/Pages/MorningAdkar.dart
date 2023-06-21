
import 'package:first_app/animation/Slider.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:first_app/model/Database_helper.dart';
import 'package:first_app/model/MorninModel.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Providers.dart';
import 'SettingsPage.dart';

class MorningDua extends StatefulWidget {
  @override
  _MorningDuaState createState() => _MorningDuaState();
}

class _MorningDuaState extends State<MorningDua>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
bool dat=false;
  List<Morning_Model> item = new List();
  DataBase_Helper db = new DataBase_Helper();

  @override
  void initState() {
    super.initState();
    db.getAllMorning().then((Allmorning) {


      Allmorning.forEach((element) {
        item.add(Morning_Model.fromMap(element));

      });

      dat=true;
    });
    //if there is  data inside the DB fetch it when app is run

  }

  var counter = [];

  @override
  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);
    // _scale=1-(_controller.value as double).toDouble() ;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //to remove a default (->) arrow back
        backgroundColor: colors.greenblue,

        title: Center(
            child: Text(
          'أذكار الصباح',
          style: TextStyle(fontSize: 20),
        )),

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
      body: FutureBuilder(

        builder: (ctx,snapShot){
          if(dat==false){

            return SpinKitThreeBounce(color: colors.lightOrange);

          }

         else{

            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: item.length,

              itemBuilder: (context, position) {

                return Column(

                  children: [

                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 1),
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  children: [
                                    // Center(
                                    //   child: Text('',style: TextStyle(fontSize: 25,color: colors.greenblue,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,),
                                    // ),
                                    Center(
                                      child: Text(
                                        '  ${item[position].Morning_Adkar}',
                                        style: TextStyle(
                                          fontSize: sip.fontSize,
                                          color: colors.greenblue,
                                          // fontWeight: FontWeight.w900,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                // clipBehavior: Clip.hardEdge,
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                    item[position].Morning_Repeat == 0
                                        ? colors.grey
                                        : colors.lightOrange,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),

                                onPressed: () {
                                  HapticFeedback.heavyImpact();
                                  setState(() {
                                    if (item[position].Morning_Repeat <= 1) {
                                      if (item[position].Morning_Repeat == 1) {
                                        sip.addAllCounter('All');
                                        sip.addAllMCounter('All_M');
                                      }
                                      item[position].Morning_Repeat = 0;

                                      if (!counter.contains(item[position])) {
                                        counter.add(item[position]);

                                        //item.removeAt(position);

                                      }
                                      if (counter.length == item.length) {
                                        sip.addAll_CompletedCounter('All_Completed');
                                        sip.addCounter('MorningCount');

                                        colors.AdkarName = 'أذكار الصباح';
                                        Navigator.of(context).pushNamedAndRemoveUntil(
                                            '/Finish',
                                                (Route<dynamic> route) => false);
                                      }

                                      // item.removeAt(position);
                                    } else {
                                      sip.addAllCounter('All');
                                      sip.addAllMCounter('All_M');
                                      item[position].Morning_Repeat -= 1;
                                    }
                                  });
                                },
                                child: Center(
                                    child: Text(
                                      'التكرار' +
                                          '   ${item[position].Morning_Repeat}    ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },

            );
          }
        }

      ),
    );
  }
}