import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: screenHeight / 20),
                      child: Image.asset(
                        "asset/images/logo_travel_app.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Travel India",
                        textAlign: TextAlign.center,
                        style: style.copyWith(color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                      width: screenWidth,
                      constraints: BoxConstraints(maxWidth: screenHeight * 0.7),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        elevation: 5.0,
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          'Login',
                          style: style,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login_screen');
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 40),
                      width: screenWidth,
                      constraints: BoxConstraints(maxWidth: screenHeight * 0.7),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        elevation: 5.0,
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          'Register',
                          style: style,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup_screen');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
