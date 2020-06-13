import 'package:flutter/material.dart';
import 'dart:math';

class loader extends StatefulWidget {
  @override
  _loaderState createState() => _loaderState();
}

class _loaderState extends State<loader>  with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  final double initial_radius=30.0;
  double radius=0;



  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 5));
    animation_radius_in=Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0,curve: Curves.elasticIn)));
    animation_radius_out=Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.25,curve: Curves.elasticOut)));

    animation_rotation=Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0,curve: Curves.linear)));

    controller.addListener(() {

      setState(() {
        if(controller.value>=0.75 && controller.value<=1){
          radius=animation_radius_in.value*initial_radius;

        }
        else if(controller.value>=0.0 && controller.value<=0.25){
          radius=animation_radius_out.value*initial_radius;

        }

      });
    });
    controller.repeat();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,

      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 30.0,
                color: Colors.black12,
              ),
              Transform.translate(

                offset: Offset(radius*cos(pi/4),radius*sin(pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.red,
                ),
              ),

              Transform.translate(
                offset: Offset(radius*cos(2*pi/4),radius*sin(2*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.green,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(3*pi/4),radius*sin(3*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.purple,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(4*pi/4),radius*sin(4*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.yellow,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(5*pi/4),radius*sin(5*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.blue,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(6*pi/4),radius*sin(6*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.grey,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(7*pi/4),radius*sin(7*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.greenAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(8*pi/4),radius*sin(8*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.blueGrey,
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
