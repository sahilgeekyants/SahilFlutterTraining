import 'package:design_layout/components.dart';
import 'package:flutter/material.dart';
class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: DynamicContainer(color: Colors.green[700],icon: Icons.widgets ,
                                bottomMargin: 2.5,topMargin: 5,leftMargin: 5,rightMargin: 2.5,
                              ),
                            ),
                            Expanded(
                              child: DynamicContainer(color: Colors.deepOrange,icon: Icons.send ,
                                bottomMargin: 2.5,topMargin: 2.5,leftMargin: 5,rightMargin: 2.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: DynamicContainer(color: Colors.blue,icon: Icons.wifi ,
                                bottomMargin: 2.5,topMargin: 5,leftMargin: 2.5,rightMargin: 5,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: DynamicContainer(color: Colors.yellowAccent,icon: Icons.view_compact ,
                                            bottomMargin: 2.5,topMargin: 2.5,leftMargin: 2.5,rightMargin: 2.5,
                                          ),
                                        ),
                                        Expanded(
                                          child: DynamicContainer(color: Colors.redAccent[700],icon: Icons.bluetooth ,
                                            bottomMargin: 2.5,topMargin: 2.5,leftMargin: 2.5,rightMargin: 2.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: DynamicContainer(color: Colors.brown,icon: Icons.print ,
                                            bottomMargin: 2.5,topMargin: 2.5,leftMargin: 5,rightMargin: 5,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: DynamicContainer(color: Colors.indigo,icon: Icons.airline_seat_flat ,
                                            bottomMargin: 2.5,topMargin: 2.5,leftMargin: 2.5,rightMargin: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: DynamicContainer(color: Colors.pink,icon: Icons.battery_alert ,
                          bottomMargin: 2.5,topMargin: 2.5,leftMargin: 5,rightMargin: 2.5,
                        ),
                      ),
                      Expanded(
                        child: DynamicContainer(color: Colors.purple,icon: Icons.desktop_windows ,
                          bottomMargin: 2.5,topMargin: 2.5,leftMargin: 2.5,rightMargin: 5,
                        ),
                      ),
                    ],
                  )
                ),
                Expanded(
                  child: DynamicContainer(color: Colors.blue,icon: Icons.radio ,
                    bottomMargin: 5,topMargin: 2.5,leftMargin: 5,rightMargin: 5,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}