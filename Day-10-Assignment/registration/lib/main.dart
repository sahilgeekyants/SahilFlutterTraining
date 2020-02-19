import 'package:flutter/material.dart';
import 'package:registration/screens/home.dart';
import 'package:registration/screens/login.dart';
import 'package:registration/screens/select.dart';
import 'package:registration/screens/signup.dart';
import 'package:registration/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: null,
      routes: {
        '/': (context) => SplashScreen(),
        '/select_screen': (context) => SelectScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignupScreen(),
        '/home_screen': (context) => Home(),
      },
      initialRoute: '/',
    );
  }
}
