//import 'dart:js';

import 'package:first_app/Pages/FinishRead.dart';
import 'package:first_app/Pages/NightAdkar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

////////////Bottom Navigation
class btmbar extends StatefulWidget {
  // var color2 = const Color(0XFFe21f26);
  @override
  _btmbarState createState() => _btmbarState();
}

class _btmbarState extends State<btmbar> {
  var _curentindex = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0XFFeb5e0b),
      selectedFontSize: 15,
      unselectedFontSize: 10,
      currentIndex: _curentindex,
      unselectedItemColor: Color(0XFF5eaaa8),
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('الإعدادات'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text('المفضلة')),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          title: Text('الصفحة الرئسية'),
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          _curentindex = index;
          Navigator.pushNamed(context, '/More');
        } else if (index == 1) {
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Home', (Route<dynamic> route) => false);
        }
      },
    );
  }
}

////////////////Drawer

var color3 = const Color(0XFF5eaaa8);
var color4 = const Color(0XFFeb5e0b);

//colors
class colors {
  static int _count = 0;

  static var grey = Colors.black26;
  static var greenblue = const Color(0XFF5eaaa8);
  static var lghtblue = const Color(0XFFa3d2ca);
  static var deepOrange = const Color(0XFFeb5e0b);
  static var lightOrange = const Color(0XFFfb8b49);
  static var lightOrange2 = const Color(0XFFe99d6f);

  ///// Finishd Adkar
  static String AdkarName;

  static String Dialog(BuildContext context, String Adkar_name) {
    String name = Adkar_name;
    var alert = AlertDialog(
      title: Text(
        "أحسنت !",
        style: TextStyle(color: lightOrange, fontWeight: FontWeight.w900),
        textDirection: TextDirection.rtl,
      ),
      content: Text(
        " لقد قرأت $name كاملة  ، بارك الله فيك ",
        style: TextStyle(color: greenblue),
        textDirection: TextDirection.rtl,
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/Home', (Route<dynamic> route) => false);
            },
            child: Text(
              'تم',
              style: TextStyle(color: lightOrange, fontWeight: FontWeight.w900),
            ))
      ],
    );
    showDialog(context: context, child: alert);
  }

  static Future<String> Back_Dialog(BuildContext context, String Adkar_name) {
    String name = Adkar_name;

    var alert2 = AlertDialog(
      //title: Text("أحسنت !", style: TextStyle(color: lightOrange),textDirection: TextDirection.rtl,),
      content: Text(
        " لم تنتهي بعد من قراءة  $name ،هل تريد الخروج حقا ؟ ",
        style: TextStyle(color: greenblue, fontWeight: FontWeight.w900),
        textDirection: TextDirection.rtl,
      ),

      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/Home', (Route<dynamic> route) => false);
            },
            child: Text(
              'خروج',
              style: TextStyle(color: lightOrange),
            )),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'متابعة القراءة',
              style: TextStyle(color: lightOrange, fontWeight: FontWeight.w900),
            )),
      ],
    );
    showDialog(context: context, child: alert2);
  }
}

class drw extends StatefulWidget {
  @override
  _drwState createState() => _drwState();
}

class _drwState extends State<drw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            color: color3,
            child: Center(
              child: Text(
                'أذكاري',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )),
          Column(
            children: [
              for (var i = 0; i < drawerIcons.length; i++)
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FlatButton(
                          child: Text(
                            drawerList[i],
                            style: mystyle.b,
                          ),
                          onPressed: () {
                            if (i == 3) {
                              Navigator.pushNamed(context, '/Statistics');
                            }
                          },
                        ),
                      ),
                      drawerIcons[i],
                    ],
                  ),
                ),
              Divider(),
            ],
          )
        ],
      ),
    );
  }
}

var drawerIcons = <Icon>[
  Icon(
    Icons.settings,
    color: color4,
  ),
  Icon(Icons.help, color: color4),
  Icon(
    Icons.info,
    color: color4,
  ),
  Icon(
    Icons.bar_chart,
    color: color4,
  ),
];

var drawerList = [
  'الإعدادات',
  'المساعدة',
  'نبذه عن البرنامج ',
  'الإحصائيات',
];

class mystyle {
  static var b = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: colors.greenblue);
  static var n = TextStyle(
      fontSize: 10, fontWeight: FontWeight.normal, color: colors.greenblue);
  static var b2 = TextStyle(
      fontSize: 10, fontWeight: FontWeight.bold, color: colors.greenblue);
}
