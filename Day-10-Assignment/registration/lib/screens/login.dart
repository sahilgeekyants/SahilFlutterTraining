import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration/components/validators.dart';

final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _loginScaffoldKey = GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  double screenHeight, screenWidth;
  String globalPassword;
  String email, password, confirmPassword;
  TextStyle style;

  TextEditingController emailController,
      passwordController,
      confirmPasswordController;

  bool emailValidate,
      passwordValidate,
      confirmPasswordValidate,
      showPassword,
      showConfirmPassword;
  Validator _validator;

  String confirmPasswordValidation(String value) {
    _loginFormKey.currentState.save();
    return _validator.confirmPasswordValidator(value, password);
  }

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Enter new Password',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          content: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              hintText: 'Password',
              hintStyle: style.copyWith(
                fontSize: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: customController,
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Update'),
              onPressed: () {
                String newPassword = customController.text.toString();
                if (newPassword.isNotEmpty) {
                  Navigator.of(context).pop(newPassword);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String snackBarMessage) {
    var snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(snackBarMessage),
      action: SnackBarAction(
          label: 'Hide',
          onPressed: _loginScaffoldKey.currentState.hideCurrentSnackBar),
    );
    _loginScaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    globalPassword = 'Pass@1234';
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    emailValidate = passwordValidate =
        confirmPasswordValidate = showPassword = showConfirmPassword = false;
    _validator = Validator();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _loginScaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Login',
          style: style.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Form(
            key: _loginFormKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: screenHeight * 0.05),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
                    controller: emailController,
                    autovalidate: emailValidate, // autovalidate flag
                    validator: _validator.emailValidator, //validator function
                    onTap: () {
                      setState(() {
                        emailValidate = true;
                      });
                    },
                    onSaved: (String value) {
                      //save the final value here
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorStyle: style.copyWith(
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.teal,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        hintText: 'Email',
                        hintStyle: style.copyWith(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        )),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
                    controller: passwordController,
                    autovalidate: passwordValidate, // autovalidate flag
                    validator:
                        _validator.passwordValidator, //validator function
                    onTap: () {
                      setState(() {
                        passwordValidate = true;
                      });
                    },
                    onSaved: (String value) {
                      //save the final value here
                      password = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      errorStyle: style.copyWith(
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.teal,
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.teal,
                        ),
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: 'Password',
                      hintStyle: style.copyWith(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    autovalidate: confirmPasswordValidate, // autovalidate flag
                    validator: confirmPasswordValidation, //validator function
                    onTap: () {
                      setState(() {
                        confirmPasswordValidate = true;
                      });
                    },
                    onSaved: (String value) {
                      //save the final value here
                      confirmPassword = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !showConfirmPassword,
                    decoration: InputDecoration(
                      errorStyle: style.copyWith(
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.teal,
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.teal,
                        ),
                        onTap: () {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: 'Confirm Password',
                      hintStyle: style.copyWith(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth,
                  child: GestureDetector(
                    child: Text(
                      "Forgot Password",
                      textAlign: TextAlign.right,
                      style: style.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    onTap: () {
                      // Display alert dialog
                      createAlertDialog(context).then((onValue) {
                        if (onValue.isNotEmpty &&
                            _validator.passwordValidator(onValue) == null) {
                          // Display Success SnackBar
                          showSnackBar('Updated Password Successfuly');
                          setState(() {
                            // Updating globle password
                            globalPassword = onValue;
                          });
                        } else {
                          // Display SnackBar for invalid password
                          showSnackBar('Invalid Password ! Try Again');
                        }
                      });
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
                      if (_loginFormKey.currentState.validate()) {
                        if (confirmPasswordController.text == globalPassword) {
                          _loginFormKey.currentState.save();
                          passwordController.text = '';
                          confirmPasswordController.text = '';

                          //save data fields here to use further in app
                          Navigator.pushNamed(context, '/home_screen');
                        } else {
                          showSnackBar('Wrong Password!');
                        }
                      }
                    },
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
