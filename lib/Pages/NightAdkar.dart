//import 'dart:html';


import 'package:flutter/material.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:first_app/model/Database_helper.dart';
import 'package:first_app/model/NightModel.dart';

import '../main.dart';
import 'Providers.dart';




class NightDua extends StatefulWidget {
  @override
  _NightDuaState createState() => _NightDuaState();
}

class _NightDuaState extends State<NightDua> with SingleTickerProviderStateMixin  {

List<Night_Model> item =new List();
DataBase_Helper db =new DataBase_Helper();

bool dat=false;

  //if there is  data inside the DB fetch it when app is run



  @override
  void initState() {
    super.initState();

    db.getAllNight().then((Allnight) {
      setState(() {
        Allnight.forEach((element) {
          item.add(Night_Model.fromMap(element));
        });
        dat = true;
      });
    });

  }


  var counter=[];
  Widget build(BuildContext context) {

    var sip = Provider.of<MyHomePageModel>(context);


    return Scaffold(

      appBar: AppBar(


        automaticallyImplyLeading: false, //to remove a default (->) arrow back
        backgroundColor:colors.greenblue,


        title: Center(child: Text('أذكار المساء',style: TextStyle(fontSize: 20),)),


        actions: [
          IconButton( icon:Icon(Icons.arrow_forward,)
            ,color: Colors.white,
            iconSize: 30,

            onPressed: (){

              setState(() {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Home', (Route<dynamic> route) => false);

                // if(counter.length==item.length ){
                //
                //
                //   colors.Dialog(context, 'أذكار المساء');
                //
                // }
                // else {
                //
                //   colors.Back_Dialog(context, 'أذكار المساء');
                //
                // }
              });

            },),


        ],
      ),
      //bottomNavigationBar: btmbar(),
      body:FutureBuilder(

        builder: (ctx,snapshot){
          if(dat==false){
            return SpinKitThreeBounce(color: colors.lightOrange);
          }
          else{
            return  ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: item.length,
              itemBuilder: (context,position){
                return Column(

                  children: [


                    Padding(padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                      child: Container(

                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height/size_container[i],


                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 1),]

                        ),
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
                                    child: Text('${item[position].Night_Adkar}',style: TextStyle(fontSize: sip.fontSize,color: colors.greenblue,),textDirection: TextDirection.rtl,),
                                  ),
                                ],
                              ),
                            ),

                            OutlinedButton(



                              style: OutlinedButton.styleFrom(backgroundColor: item[position].Night_Repeat==0?colors.grey:colors.lightOrange,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),tapTargetSize:MaterialTapTargetSize.shrinkWrap ),

                              onPressed: (){

                                HapticFeedback.heavyImpact();
                                setState(() {


                                  if(item[position].Night_Repeat<=1){
                                    if(item[position].Night_Repeat==1){
                                      sip.addAllCounter('All');
                                      sip.addAllNCounter('All_N');
                                    }
                                    item[position].Night_Repeat=0;

                                    if(!counter.contains(item[position])){
                                      counter.add(item[position]);
                                    }

                                    if(counter.length==item.length  ){

                                      sip.addAll_CompletedCounter('All_Completed');
                                      sip.addCounter2('NightCount');

                                      colors.AdkarName='أذكار المساء ';
                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                          '/Finish', (Route<dynamic>route) => false);
                                      //colors.Dialog(context, 'أذكار الصباح');


                                    }

                                  }
                                  else{
                                    sip.addAllCounter('All');
                                    sip.addAllNCounter('All_N');

                                    item[position].Night_Repeat-=1;




                                  }
                                });

                              }

                              , child: Center(child: Text('التكرار'+'   ${item[position].Night_Repeat}    ',style: TextStyle(fontSize:18,color: Colors.white,),)),

                            )


                          ],
                        ),
                      ),)
                  ],
                );
              },
            );
          }
        },
      ),


      );



  }

}


