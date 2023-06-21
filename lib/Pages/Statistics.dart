import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Bars.dart';
import 'Providers.dart';
import 'package:first_app/main.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    var sip = Provider.of<MyHomePageModel>(context);

    return Material(
      child: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
//All Adkar
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2),
                      ]),
                  child: Column(
                    children: [
                      Text(
                        'مجموع الأذكار المقروءة',
                        style: TextStyle(
                            fontSize: 20,
                            color: colors.greenblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${sip.getAllCounter()}',
                        style: TextStyle(
                            fontSize: 20,
                            color: colors.deepOrange,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  قراءتك للأذكار كاملة',
                        style: TextStyle(
                            fontSize: 20,
                            color: colors.greenblue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${sip.getAll_CompletedCounter()}',
                        style: TextStyle(
                            fontSize: 20,
                            color: colors.deepOrange,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //Row 1
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Container(
                        // height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'أذكار الصباح',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'مجموع الأذكار المقروءة',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getAllMCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '  قراءتك للأذكار كاملة',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getMCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Container(
                        //height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'أذكار المساء',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'مجموع الأذكار المقروءة',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getAllNCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '  قراءتك للأذكار كاملة',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getNCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //Row 2
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Container(
                        // height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'أذكار الصلاة',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'مجموع الأذكار المقروءة',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getAllPCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '  قراءتك للأذكار كاملة',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getPCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Container(
                        //height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'أذكار النوم',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'مجموع الأذكار المقروءة',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getAllSCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '  قراءتك للأذكار كاملة',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.greenblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${sip.getSCounter()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
