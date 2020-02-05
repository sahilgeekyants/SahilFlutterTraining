import 'package:flutter/material.dart';

/*class RowWidget extends StatefulWidget {
  double height,width;
  IconData icon;
  Color color;
  RowWidget(this.height,this.width,this.color,this.icon);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return rowWidgetState(height,width,color,icon);
  }  
}
class ColumnWidget extends StatefulWidget {
  double height,width;
  IconData icon;
  Color color;
  ColumnWidget(this.height,this.width,this.color,this.icon);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return columnWidgetState(height,width,color,icon);
  }
}
class rowWidgetState extends State<RowWidget>{
  double height,width;
  IconData icon;
  Color color;
  rowWidgetState(this.height,this.width,this.color,this.icon);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  
}
class columnWidgetState extends State<ColumnWidget> {
  double height,width;
  IconData icon;
  Color color;
  columnWidgetState(this.height,this.width,this.color,this.icon);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  } 
}*/

class ContainerWidget extends StatefulWidget{
  double height,width,topMargin,bottomMargin,leftMargin,rightMargin;
  IconData icon;
  Color color;
  ContainerWidget({@required this.height,@required this.width,@required this.color,@required this.icon,
    this.topMargin=0.0,this.bottomMargin=0.0,this.leftMargin=0.0,this.rightMargin=0.0}
  );
  @override
  State<StatefulWidget> createState() {
    return ContainerWidgetState(height: this.height, width: this.width, color: this.color, icon: this.icon,topMargin: this.topMargin,bottomMargin: this.bottomMargin,leftMargin: this.leftMargin,rightMargin: this.rightMargin);
  } 
}
class ContainerWidgetState extends State<ContainerWidget>{
  double height,width,topMargin,bottomMargin,leftMargin,rightMargin;
  IconData icon;
  Color color;
  ContainerWidgetState({@required this.height,@required this.width,@required this.color,@required this.icon,this.topMargin,this.bottomMargin,this.leftMargin,this.rightMargin});
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(
                top: topMargin,
                bottom: bottomMargin,
                left: leftMargin,
                right: rightMargin
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              constraints: BoxConstraints(
                minHeight: height, //double.infinity,
                minWidth: width,
              ),
              child: Center(
                child: Icon(icon ,color: Colors.white,),
              )
            );
  }
  
}