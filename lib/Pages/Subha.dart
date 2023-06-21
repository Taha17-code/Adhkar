import 'package:provider/provider.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:first_app/Pages/Providers.dart';
import 'package:first_app/model/Database_helper.dart';
import 'package:first_app/model/SubhaModel.dart';
import 'package:flutter/material.dart';


class Subha extends StatefulWidget {
  @override
  _SubhaState createState() => _SubhaState();
}

class _SubhaState extends State<Subha> {

  List<Subha_Model> item =new List();
  DataBase_Helper db =new DataBase_Helper();

  void initState(){
    super.initState();

    //if there is  data inside the DB fetch it when app is run
    db.getAllpraise().then((Allpraise){
      setState(() {

        Allpraise.forEach((element) {
          item.add(Subha_Model.fromMap(element));
        });

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var sip = Provider.of<DuaPass>(context);
    return Scaffold(

      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context,position){
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                sip.DuaName=item[position].praise_Adkar;
                sip.duaRepeat=item[position].praise_Repeat;

                Navigator.pushNamed(context, '/Tasbeeh');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.17),
                        spreadRadius: 4,
                        blurRadius:10),]

              ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${item[position].praise_Adkar}',style: TextStyle(color: colors.greenblue,fontWeight: FontWeight.bold,fontSize: 15),textDirection: TextDirection.rtl,),
                      Text('  مرات  ${item[position].praise_Repeat} ',style: TextStyle(color: colors.lightOrange,fontWeight: FontWeight.bold),),
                    ],
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
