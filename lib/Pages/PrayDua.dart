import 'package:first_app/Pages/Providers.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:first_app/model/Database_helper.dart';
import 'package:first_app/model/PrayModel.dart';
import 'package:first_app/Pages/Bars.dart';

class PrayDua extends StatefulWidget {
  @override
  _PrayDuaState createState() => _PrayDuaState();
}

class _PrayDuaState extends State<PrayDua> {
  List<Pray_Model> item = new List();
  DataBase_Helper db = new DataBase_Helper();
bool dat;
  void initState() {
    super.initState();

    //if there is  data inside the DB fetch it when app is run
    db.getAllPray().then((AllPray) {

        AllPray.forEach((element) {
          item.add(Pray_Model.fromMap(element));
        });
        dat=true;

    });
  }

  var counter = [];

  @override
  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //to remove a default (->) arrow back
        backgroundColor: colors.greenblue,

        title: Center(
            child: Text(
          'أذكار الصلاة',
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
                // if (counter.length == item.length) {
                //   //sip.addCounter('PrayCount');
                //   colors.Dialog(context, 'أذكار الصلاة');
                // } else {
                //   colors.Back_Dialog(context, 'أذكار الصلاة');
                // }
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Home', (Route<dynamic> route) => false);

              });
            },
          ),
        ],
      ),
      body:
      FutureBuilder(
        builder: (ctx,snapsht){
          if(dat==false){
            return SpinKitThreeBounce(color: colors.lightOrange);
          }
          else{
            return  ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, position) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
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
                                    Center(
                                      child: Text(
                                        '${item[position].Pray_Adkar}',
                                        style: TextStyle(
                                          fontSize: sip.fontSize,
                                          color: colors.greenblue,
                                         // fontWeight: FontWeight.bold,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: item[position].Pray_Repeat == 0
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
                                    if (item[position].Pray_Repeat <= 1) {
                                      if (item[position].Pray_Repeat == 1) {
                                        sip.addAllCounter('All');
                                        sip.addAllPCounter('All_P');
                                      }
                                      item[position].Pray_Repeat = 0;

                                      if (!counter.contains(item[position])) {
                                        counter.add(item[position]);
                                      }

                                      if (counter.length == item.length) {
                                        sip.addAll_CompletedCounter('All_Completed');
                                        sip.addCounterP('PrayCount');
                                        colors.AdkarName = 'أذكار الصلاة ';
                                        Navigator.of(context).pushNamedAndRemoveUntil(
                                            '/Finish',
                                                (Route<dynamic> route) => false);
                                      }
                                    } else {
                                      sip.addAllCounter('All');
                                      sip.addAllPCounter('All_P');
                                      item[position].Pray_Repeat -= 1;
                                    }
                                  });
                                },
                                child: Center(
                                    child: Text(
                                      'التكرار' + '   ${item[position].Pray_Repeat}    ',
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
        },
      )



    );
  }
}
