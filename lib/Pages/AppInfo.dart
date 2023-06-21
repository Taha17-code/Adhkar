import 'package:first_app/Pages/Bars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';


class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Padding(padding: EdgeInsets.fromLTRB(20, 70, 20, 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',scale:5,),


              ],
            ),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 100),
                  child: Text('تطبيق للذاكرين صدقه جارية لنا ولكم ولجميع المسلمين  لاتنسونا من الدعاء.',
                    style: TextStyle(fontSize:20,color: colors.greenblue,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                )),




              ],
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Center(child: Text('شارك التطبيق', style: TextStyle(fontSize:20,color: colors.lghtblue,fontWeight: FontWeight.bold),)),



              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(child: IconButton(icon: Icon(Icons.share_rounded,size: 35,color: colors.deepOrange,),
                    onPressed: (){
                      Share.share(' حمل تطبيق للذاكرين انشر ولك الأجر https://example.com', subject: 'تطبيق للذاكرين');
                    })),
              ],
            )
          ],
        ),
      ),),
    ));
  }
}

