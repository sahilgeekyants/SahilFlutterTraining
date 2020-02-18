import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  //final double screenHeight, screenWidth;
  //LoginScreen(this.screenHeight, this.screenWidth);
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  double screenHeight, screenWidth;
  TextStyle style;
  //LoginScreenState(this.screenHeight, this.screenWidth);
  @override
  void initState() {
    screenHeight = MediaQuery.of(context).size.height;
    screenHeight = MediaQuery.of(context).size.width;
    style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
