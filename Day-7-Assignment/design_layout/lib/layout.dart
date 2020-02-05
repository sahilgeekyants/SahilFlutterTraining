import 'package:flutter/material.dart';
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
                          Container(
                            margin: EdgeInsets.only( bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            constraints: BoxConstraints(
                              minHeight: (480/6)*2-5, //double.infinity,
                              minWidth: 300/2,
                            ),
                            child: Center(
                              child: Icon(Icons.widgets ,color: Colors.white,),
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(top:5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            constraints: BoxConstraints(
                              minHeight: (480/6)*2-5, //double.infinity,
                              minWidth: 300/2,
                            ),
                            child: Center(
                              child: Icon(Icons.send ,color: Colors.white,),
                            )
                          ),
                        ],
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only( bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            constraints: BoxConstraints(
                              minHeight: (480/6)-10, //double.infinity,
                              minWidth: 300/2,
                            ),
                            child: Center(
                              child: Icon(Icons.wifi ,color: Colors.white,),
                            )
                          ),

                          //pending from here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only( bottom: 5,right: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    constraints: BoxConstraints(
                                      minHeight: (480/6)*2-5, //double.infinity,
                                      minWidth: 300/4-5,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.view_compact ,color: Colors.white,),
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top:5,right: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    constraints: BoxConstraints(
                                      minHeight: (480/6)-5, //double.infinity,
                                      minWidth: 300/4-5,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.bluetooth ,color: Colors.white,),
                                    )
                                ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only( bottom: 5,left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    constraints: BoxConstraints(
                                      minHeight: (480/6)-5, //double.infinity,
                                      minWidth: 300/4-5,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.print ,color: Colors.white,),
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top:5,left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    constraints: BoxConstraints(
                                      minHeight: (480/6)*2-5, //double.infinity,
                                      minWidth: 300/4-5,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.airline_seat_flat ,color: Colors.white,),
                                    )
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        constraints: BoxConstraints(
                          minHeight: 480/6, //double.infinity,
                          minWidth: 300*3/4+5,
                        ),
                        child: Center(
                          child: Icon(Icons.battery_alert ,color: Colors.white,),
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        constraints: BoxConstraints(
                          minHeight: 480/6, //double.infinity,
                          minWidth: 300/4-5,
                        ),
                        child: Center(
                          child: Icon(Icons.desktop_windows ,color: Colors.white,),
                        )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        constraints: BoxConstraints(
                          minHeight: 480/6, //double.infinity,
                          minWidth: 310,
                        ),
                        child: Center(
                          child: Icon(Icons.radio ,color: Colors.white,),
                        )
                      )
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