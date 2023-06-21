import 'package:first_app/Pages/Bars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_app/main.dart';

class Finish extends StatefulWidget {
  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<Finish> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 850),
      lowerBound: 0.7,
      upperBound: 1.0,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void diapose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: colors.greenblue,
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Finished.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' أحسنت لقد قرأت   ',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                '   ${colors.AdkarName}  كاملة  ',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              ScaleTransition(
                scale: _animation,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(100),
                  ),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/Home', (Route<dynamic> route) => false);
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: colors.deepOrange,
                        size: 35,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
