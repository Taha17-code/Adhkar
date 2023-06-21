import 'package:flutter/material.dart';


enum SlideDirection {fromTop,fromLeft,fromRight,fromBottom}
class SliderAnimation extends StatefulWidget {

  final int position ;
  final int itemCount ;
  final Widget child ;
  final SlideDirection slideDirection;
  final  AnimationController animationController;


  SliderAnimation({this.position, this.itemCount, this.child,
    this.slideDirection, this.animationController});


  @override
  _SliderAnimationState createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {



  @override
  Widget build(BuildContext context) {

    //we need x and y Translations variables to animate item from different Directions
    var _xTranslation=0.0 ,   _yTranslation=0.0 ;

    //we need to declare of our animation for fade transition widget

    var _animation=Tween(begin: 0.0,end: 0.3).animate(
        CurvedAnimation(
          // ignore: missing_return
          parent: widget.animationController,

          //curve for the way you want to animate you list
          curve: Interval((1/widget.itemCount)*widget.position,1.0,curve: Curves.fastOutSlowIn),


        )
    );




    return AnimatedBuilder(
        animation: widget.animationController,
        builder: (context,child){

          if(widget.slideDirection==SlideDirection.fromTop){
            _yTranslation=-50 *(0.1 - _animation.value);
          }
          else if(widget.slideDirection==SlideDirection.fromBottom){
            _yTranslation= 50 *(0.1 - _animation.value);
          }
          else if(widget.slideDirection==SlideDirection.fromRight){
            _xTranslation= 400 *(0.1 - _animation.value);
          }
          else {
            _xTranslation= -400 *(0.1 - _animation.value);
          }
          
          return FadeTransition(opacity: _animation,

          child: Transform(
            child: widget.child,
            transform: Matrix4.translationValues(_xTranslation, _yTranslation, 0.0),


          ),


          );

          


        });
  }
}
