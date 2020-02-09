import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  TextStyle style = TextStyle(fontFamily: 'Montserrat',fontSize: 20.0);
    return Scaffold(
      backgroundColor: Colors.indigo,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                    child: Container(
                      child: Image.asset(
                      "assets/logo_travel_app.png",
                      fit: BoxFit.contain,
                      ),
                    )
                  ),
                  SizedBox(
                    height: 85.0,
                    child: Text("Travel India",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: false,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)
                      )
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  TextField(
                    obscureText: true,
                    style: style,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)
                      )
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  SizedBox(
                    height: 30.0,
                    width: 220,
                    child: Text("Forgot Password",
                      textAlign: TextAlign.right,
                      style: style.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 13
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.teal,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {},
                      child: Text("Login",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}