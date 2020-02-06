import 'package:flutter/material.dart';
import 'dart:math';

class DynamicContainer extends StatefulWidget {
  double topMargin,bottomMargin,leftMargin,rightMargin;
  IconData icon;
  Color color;
  DynamicContainer({@required this.color,@required this.icon,
    this.topMargin=0.0,this.bottomMargin=0.0,this.leftMargin=0.0,this.rightMargin=0.0}
  );
  @override
  State<StatefulWidget> createState() {
    return DynamicContainerState(color: this.color, icon: this.icon,topMargin: this.topMargin,
      bottomMargin: this.bottomMargin,leftMargin: this.leftMargin,rightMargin: this.rightMargin);
  }
} 

class DynamicContainerState extends State<DynamicContainer> {
  double topMargin,bottomMargin,leftMargin,rightMargin;
  IconData icon;
  Color color;
  List<Color> colorList =  [Colors.green[700],Colors.deepOrange,Colors.blue,Colors.yellowAccent,
                            Colors.redAccent[700],Colors.brown,Colors.indigo,Colors.pink,Colors.purple,Colors.blue,];
  var random = Random();
  DynamicContainerState({@required this.color,@required this.icon,
    this.topMargin,this.bottomMargin,this.leftMargin,this.rightMargin});
  void changeColor(){
    setState(() {
      color = colorList.elementAt(random.nextInt(10)) ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {changeColor();},
      child: Container(
              margin: EdgeInsets.only(top: topMargin,bottom: bottomMargin,
                left: leftMargin,right: rightMargin
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Icon(icon ,color: Colors.white,),
              )
            ),
    );
  }
}