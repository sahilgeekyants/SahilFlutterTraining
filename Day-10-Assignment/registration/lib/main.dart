import 'package:flutter/material.dart';
import 'package:registration/screens/home.dart';
import 'package:registration/screens/login.dart';
import 'package:registration/screens/select.dart';
import 'package:registration/screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.teal,
      ),
      home: null,
      routes: {
        '/': (context) => SelectScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignupScreen(),
        '/home_screen': (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}
