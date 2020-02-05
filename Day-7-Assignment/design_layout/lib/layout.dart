import 'package:flutter/material.dart';
import 'components.dart';
class Layout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color:Colors.indigo,
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ContainerWidget(height: (480/6)*2-5, width: 300/2,
                            color: Colors.green, icon: Icons.widgets,bottomMargin: 5
                          ),
                          ContainerWidget(height: (480/6)*2-5, width: 300/2, 
                            color: Colors.red, icon: Icons.send,topMargin: 5
                          ),
                        ],
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ContainerWidget(height: (480/6)-10, width: 300/2, 
                            color: Colors.blue, icon: Icons.wifi,bottomMargin: 10
                          ),
                          //pending from here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  ContainerWidget(height: (480/6)*2-5, width: 300/4-5, 
                                    color: Colors.yellow, icon: Icons.view_compact,bottomMargin: 5,rightMargin: 5,
                                  ),
                                  ContainerWidget(height: (480/6)-5, width: 300/4-5, 
                                    color: Colors.red, icon: Icons.bluetooth,topMargin: 5,rightMargin: 5,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  ContainerWidget(height: (480/6)-5, width: 300/4-5, 
                                    color: Colors.brown, icon: Icons.print,bottomMargin: 5,leftMargin: 5,
                                  ),
                                  ContainerWidget(height: (480/6)*2-5, width: 300/4-5, 
                                    color: Colors.indigo, icon: Icons.airline_seat_flat,topMargin: 5,leftMargin: 5,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ContainerWidget(height: (480/6), width: 300*3/4+5, 
                        color: Colors.pink, icon: Icons.battery_alert,
                      ),
                      ContainerWidget(height: (480/6), width: 300/4-5, 
                        color: Colors.purple, icon: Icons.desktop_windows,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ContainerWidget(height: (480/6), width: 310, 
                        color: Colors.blue, icon: Icons.radio,
                      ),
                    ],
                  ),
                  
                ],
              ),
            )
            ),
        ),
      );
  }

}