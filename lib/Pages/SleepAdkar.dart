import 'package:flutter/material.dart';
import 'package:first_app/main.dart';
import 'package:first_app/model/Database_helper.dart';
import 'package:first_app/model/SleepModel.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'Providers.dart';


class SleepDua extends StatefulWidget {
  @override
  _SleepDuaState createState() => _SleepDuaState();
}

class _SleepDuaState extends State<SleepDua> {

  List<Sleep_Model> item =new List();
  DataBase_Helper db =new DataBase_Helper();
  bool dat=false;

  void initState(){
    super.initState();

    //if there is  data inside the DB fetch it when app is run
    db.getAllSleep().then((Allsleep){
      setState(() {

        Allsleep.forEach((element) {
          item.add(Sleep_Model.fromMap(element));
        });
        dat=true;

      });
    });
  }

  var counter=[];



  @override

  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);


    return Scaffold(

      appBar: AppBar(

        automaticallyImplyLeading: false, //to remove a default (->) arrow back

        backgroundColor:colors.greenblue,


        title: Center(child: Text('أذكار النوم',style: TextStyle(fontSize: 20),)),


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
                //   colors.Dialog(context, 'أذكار النوم');
                //
                // }
                // else {
                //
                //   colors.Back_Dialog(context, 'أذكار النوم');
                //
                // }
              });

            },),


        ],
      ),

      body:FutureBuilder(
         builder: (ctx,snapshot){
           if(dat==false){
             return SpinKitThreeBounce(color: colors.lightOrange);
           }

           else{
             return  ListView.builder(
               itemCount: item.length,
               itemBuilder: (context,position){
                 return Padding(padding: EdgeInsets.fromLTRB(15, 30, 15, 20),

                   child: Container(

                     width: MediaQuery.of(context).size.width,


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

                               Center(
                                 child: Text('${item[position].Sleep_Adkar}',style: TextStyle(fontSize: sip.fontSize,color: colors.greenblue,),textDirection: TextDirection.rtl,),
                               ),
                             ],
                           ),
                         ),

                         OutlinedButton(


                           style: OutlinedButton.styleFrom(backgroundColor: item[position].Sleep_Repeat==0?colors.grey:colors.lightOrange ,

                               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                                   bottomRight: Radius.circular(20))),tapTargetSize:MaterialTapTargetSize.shrinkWrap  ),

                           onPressed: (){
                             HapticFeedback.heavyImpact();
                             setState(() {


                               if(item[position].Sleep_Repeat<=1){
                                 if(item[position].Sleep_Repeat==1){
                                   sip.addAllCounter('All');
                                   sip.addAllSCounter('All_S');
                                 }
                                 item[position].Sleep_Repeat=0;



                                 if(!counter.contains(item[position])){
                                   counter.add(item[position]);


                                 }

                                 if(counter.length==item.length  ){

                                   sip.addAll_CompletedCounter('All_Completed');
                                   sip.addCounter3('SleepCount');

                                   colors.AdkarName='أذكار النوم';

                                   Navigator.of(context).pushNamedAndRemoveUntil(
                                       '/Finish', (Route<dynamic>route) => false);
                                   //colors.Dialog(context, 'أذكار الصباح');


                                 }



                               }



                               else{

                                 sip.addAllCounter('All');
                                 sip.addAllSCounter('All_S');
                                 item[position].Sleep_Repeat-=1;



                               }
                             });

                           }

                           , child: Center(child: Text('التكرار'+'   ${item[position].Sleep_Repeat}    ' ,style: TextStyle(fontSize:18,color: Colors.white,),)),

                         )


                       ],
                     ),
                   ),
                 );
               },
             );
           }
         }


      ),
    );

  }
}
