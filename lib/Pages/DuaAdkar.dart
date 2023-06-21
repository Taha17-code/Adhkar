



import 'package:first_app/model/DuaModel.dart';
import 'package:first_app/model/DuaModel.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Pages/Bars.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:first_app/model/DuaModel.dart';
import 'package:first_app/model/Database_helper.dart';
import 'package:provider/provider.dart';

import 'Providers.dart';





class DuaAdkar extends StatefulWidget {

  Dua_Model dua_model;
  DuaAdkar({this.dua_model});
  @override
  _DuaAdkarState createState() => _DuaAdkarState();
}

class _DuaAdkarState extends State<DuaAdkar>   {
   var counter=[];




  List<Dua_Model> item =new List();
  DataBase_Helper db =new DataBase_Helper();

TextEditingController _DuaName = new TextEditingController();
TextEditingController _DuaContent = new TextEditingController();
TextEditingController _DuaRepeat = new TextEditingController();



  void initState(){
    super.initState();


    //if there is  data inside the DB fetch it when app is run
    db.getAllDua().then((Alldua){
      setState(() {

        Alldua.forEach((element) {
          item.add(Dua_Model.fromMap(element));
        });




      });
      // _DuaName =new TextEditingController(text: widget.dua_model.Dua_name);
      // _DuaContent=new TextEditingController(text: widget.dua_model.Dua_Adkar);
      // _DuaRepeat=new TextEditingController(text: widget.dua_model.Dua_Repeat.toString());

    });
  }


  @override


  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.greenblue,
        splashColor: colors.lghtblue,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: (){
          Navigator.pushNamed(context, '/addDua');
        },
      ),
      appBar: AppBar(


        automaticallyImplyLeading: false, //to remove a default (->) arrow back
        backgroundColor:colors.greenblue,

      // leading: Padding(padding: EdgeInsets.all(4),
      //   child:  IconButton(icon: Icon(Icons.add,color: Colors.white,),onPressed: (){
      //     Navigator.pushNamed(context, '/addDua');
      //    // Insert_Dialog(context);
      // },) ,) ,
        title: Center(child: Text('أدعية منوعة',style: TextStyle(fontSize: 20),)),


        actions: [








        ],
      ),

      //bottomNavigationBar: btmbar(),
      body:ListView.builder(


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
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Expanded(flex: 6,child: Center(child: Text('${item[position].Dua_name}',style: TextStyle(fontSize: sip.fontSize,color: colors.greenblue,fontWeight: FontWeight.w900,),textDirection: TextDirection.rtl,))),
                               Expanded(flex: 1,child:IconButton(icon: Icon(Icons.clear,color:colors.lightOrange2),onPressed: ()=>
                                 _deleteDua(context,item[position],position)
                               ,)),

                              //Expanded(flex:1,child: IconButton(icon: Icon(Icons.favorite_border,size: 18), onPressed: (){}))
                              ],
                            ),
                            Center(
                              child: Text('${item[position].Dua_Adkar}',style: TextStyle(fontSize: sip.fontSize,color: colors.greenblue,),textDirection: TextDirection.rtl,),
                            ),
                          ],
                        ),
                      ),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(backgroundColor: item[position].Dua_Repeat==0?colors.grey:colors.lightOrange,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),tapTargetSize:MaterialTapTargetSize.shrinkWrap ),

                        onPressed: (){
                          HapticFeedback.heavyImpact();
                          setState(() {


                            if(item[position].Dua_Repeat<=1){
                              item[position].Dua_Repeat=0;

                              if(!counter.contains(item[position])){
                                counter.add(item[position]);
                              }


                            }

                            else{
                              item[position].Dua_Repeat-=1;
                            }
                          });

                        }

                        , child: Center(child: Text('التكرار'+'   ${item[position].Dua_Repeat}    ' ,style: TextStyle(fontSize:18,color: Colors.white,),)),

                      )


                    ],
                  ),
                ),)
            ],
          );
        },
      ),

    );



  }



void  Insert_Dialog(BuildContext context) async {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();



    var alert2 = AlertDialog(

      title: Center(child: Text("إضافه دعاء", style: TextStyle(color: colors.lightOrange),/*textDirection: TextDirection.rtl,*/)),

      content:


          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(15),
                  child: TextFormField(


                   controller: _DuaName,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 15),

                    decoration: new InputDecoration(


                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                          borderSide:
                          new BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(20.0)),

                      hintText: 'إسم الدعاء',hintStyle: TextStyle(color: colors.greenblue)
                    ),
                  ),),
                  Padding(padding: EdgeInsets.all(15),
                    child: TextFormField(
                    keyboardType: TextInputType.multiline,
                      controller: _DuaContent,

                      style: TextStyle(fontSize: 15),
                      textDirection: TextDirection.rtl,
                      //maxLines: 30,
                     // expands: true,


                      decoration: new InputDecoration(

                        fillColor: Colors.white60,
                        border: OutlineInputBorder(

                            borderSide:
                            new BorderSide(color: Colors.black87,),
                            borderRadius: BorderRadius.circular(20.0)),


                        hintText: ' الدعاء',hintStyle: TextStyle(color: colors.greenblue,)
                      ),
                    ),),
                  Padding(padding: EdgeInsets.all(15),
                    child: TextFormField(


                      style: TextStyle(fontSize: 15),

                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      controller: _DuaRepeat,

                      textDirection: TextDirection.rtl,


                      decoration: new InputDecoration(

                        fillColor: Colors.white60,
                        border: OutlineInputBorder(
                            borderSide:
                            new BorderSide(color: Colors.black87),
                            borderRadius: BorderRadius.circular(20.0)),

                        hintText: 'مرات التكرار',hintStyle: TextStyle(color: colors.greenblue)
                      ),
                    ),),
                ],
              ),
            ),
          ),

      actions: [

        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 5, 10),
          child: FlatButton(


            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.grey,
              onPressed: (){


           Navigator.pop(context);

    }, child: Row(  mainAxisAlignment: MainAxisAlignment.center,children: [Text('إلغاء', style: TextStyle(color: Colors.white70),)],)
  ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlatButton (


              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: colors.greenblue,
              onPressed: () async {

                await db.CreateDua(Dua_Model(

                  _DuaName.text,
                  _DuaContent.text,
                  int.parse(_DuaRepeat.text),
                )).then((_) =>  _CreateDua(context));


                Navigator.pop(context);

              }, child: Row(  mainAxisAlignment: MainAxisAlignment.center,children: [Text('إضافه', style: TextStyle(color: Colors.white70),)],)
          ),
        ),
      ],

    );
    showDialog(context: context,child:alert2 );
  }

  void _CreateDua(BuildContext context) async{

   await db.getAllDua().then((Alldua){
      setState(() {

        item.clear();
         Alldua.forEach((element) {
          item.add(Dua_Model.fromMap(element));
        });


      });

    });
  }

   Future<String> _deleteDua(BuildContext context,Dua_Model dua_model,int position) {
    // String name = Adkar_name;


     var alert2 = AlertDialog(
       //title: Text("أحسنت !", style: TextStyle(color: lightOrange),textDirection: TextDirection.rtl,),
       content: Row(
         children: [

           Text(" هل حقا تريد حذف هذا الدعاء ؟ ", style: TextStyle(color: colors.greenblue,fontWeight: FontWeight.w900),textDirection: TextDirection.rtl,),
           Icon(Icons.clear,color: colors.greenblue,),

         ],
       ),

       actions: [
         FlatButton(

             onPressed: (){



               Navigator.pop(context);

             }, child: Text('تراجع', style: TextStyle(color: colors.lghtblue,fontWeight: FontWeight.w900),)
         ),
         FlatButton(

             onPressed: (){
               db.deleteDua(dua_model.Dua_name).then((Duas) {

                 setState(() {
                   item.removeAt(position);
                 });
               });
               Navigator.pop(context);
         }, child: Text('حذف', style: TextStyle(color: colors.deepOrange,fontWeight: FontWeight.bold),)
         ),

       ],

     );
     showDialog(context: context,child:alert2 );
   }
}


