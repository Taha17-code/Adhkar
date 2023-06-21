import 'package:first_app/model/Database_helper.dart';
import 'package:first_app/model/DuaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Bars.dart';

class addDua extends StatefulWidget {
  @override
  _addDuaState createState() => _addDuaState();
}

class _addDuaState extends State<addDua> {
  List<Dua_Model> item = new List();
  DataBase_Helper db = new DataBase_Helper();

  TextEditingController _DuaName = new TextEditingController();
  TextEditingController _DuaContent = new TextEditingController();
  TextEditingController _DuaRepeat = new TextEditingController();

  void initState() {
    super.initState();

    //if there is  data inside the DB fetch it when app is run
    db.getAllDua().then((Alldua) {
      setState(() {
        Alldua.forEach((element) {
          item.add(Dua_Model.fromMap(element));
        });
      });

    });
  }

  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
              child: Center(
                  child: Text(
                'إضافة دعاء ',
                style: TextStyle(color: colors.greenblue, fontSize: 35),
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Center(
                  child: Text(
                'املأ الحقول لإضافة دعاء في اسفل صفحة الأدعيه  ',
                style: TextStyle(color: colors.lghtblue, fontSize: 15),
              )),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "اكتب اسم الدعاء";
                            }

                            return null;

                          },
                          controller: _DuaName,
                          style: TextStyle(fontSize: 15),
                          decoration: new InputDecoration(
                              fillColor: Colors.white60,
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: 'إسم الدعاء',
                              hintStyle: TextStyle(color: colors.greenblue)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "اكتب الدعاء";
                            }

                            return null;

                          },
                          keyboardType: TextInputType.multiline,
                          controller: _DuaContent,
                          maxLines: 6,

                          style: TextStyle(fontSize: 15),

                          //maxLines: 30,
                          // expands: true,

                          decoration: new InputDecoration(
                              fillColor: Colors.white60,
                              border: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.black87,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: ' الدعاء',
                              hintStyle: TextStyle(
                                color: colors.greenblue,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          validator: (val){
                            if(val.isEmpty){
                              return "اكتب عدد مرات تكرار الدعاء";
                            }

                              return null;

                          },
                          
                          style: TextStyle(fontSize: 15),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          controller: _DuaRepeat,
                          decoration: new InputDecoration(
                              fillColor: Colors.white60,
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: 'مرات التكرار',
                              hintStyle: TextStyle(color: colors.greenblue)),
                        ),
                      ),
                    ),
                    Center(
                      child: FlatButton(
                        textColor: Colors.white,
                        color: colors.greenblue,
                        child: Text('إضافة'),
                        onPressed: () async {
                          if(!_formkey.currentState.validate()){
                            return;
                          }
                          await db.CreateDua(Dua_Model(
                            _DuaName.text,
                            _DuaContent.text,
                            int.parse(_DuaRepeat.text),
                          )).then((_) => _CreateDua(context));

                          Navigator.pushNamedAndRemoveUntil(
                              context, '/DuaAdkar', (route) => false);
                          // Navigator.pop(context);

                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _CreateDua(BuildContext context) async {
    await db.getAllDua().then((Alldua) {
      setState(() {
        item.clear();
        Alldua.forEach((element) {
          item.add(Dua_Model.fromMap(element));
        });
      });
    });
  }
}
