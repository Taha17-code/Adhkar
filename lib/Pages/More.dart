import 'package:first_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Bars.dart';
import 'Providers.dart';
import 'package:provider/provider.dart';

class Tasbeeh extends StatefulWidget {
  @override
  _TasbeehState createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> with SingleTickerProviderStateMixin {
  var Counter=0;
  int x;
  int cycle=0;
  @override
  Widget build(BuildContext context) {
    var sip = Provider.of<DuaPass>(context);
    return Scaffold(
        body: Container(
          alignment: Alignment.center,

          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Column(children: [ Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('${sip.DuaName} ',style: TextStyle(color: colors.greenblue,fontSize: 25,fontWeight: FontWeight.w800),textDirection: TextDirection.rtl,),
                          ),
                        ),
                      ),
                    ],
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('عدد مرات التكرار ',style: TextStyle(color: colors.greenblue,fontSize:15,),),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('عدد الدورات',style: TextStyle(color: colors.greenblue,fontSize:15,),),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Expanded(
                          child: Row(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text('${sip.duaRepeat}',style: TextStyle(color: colors.deepOrange,fontSize:20,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ), Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text('$cycle',style: TextStyle(color: colors.deepOrange,fontSize:20,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),],),


                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: (){





                            HapticFeedback.selectionClick();
                            setState(() {

                              Counter++;
                              if(Counter==sip.duaRepeat||Counter==x){
                                HapticFeedback.vibrate();
                                x=Counter+sip.duaRepeat;
                                cycle+=1;

                              }



                            });
                          },
                          child: Container(

                            width: MediaQuery.of(context).size.width/1.5,
                            height: MediaQuery.of(context).size.height/3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color:colors.lightOrange,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius:7),]

                            ),
                            child: Center(
                              child: Text( '$Counter',style: TextStyle(color: Colors.white,fontSize:60,),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                      child: Center(child: IconButton(icon: Icon(Icons.replay,size: 40,color: colors.greenblue,),onPressed: (){

                       setState(() {
                         Counter=0;
                       });

                      },)),)
                    ],
                  )



                ],
              ),
            ),

          ),
        ));
  }
}
