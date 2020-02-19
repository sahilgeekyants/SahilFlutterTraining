import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration/components/validators.dart';

GlobalKey<FormState> _globalKey = GlobalKey();

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends State<SignupScreen> {
  double screenHeight, screenWidth;
  String name, email, phoneNo, password, confirmPassword;
  TextStyle style;
  bool nameValidate,
      emailValidate,
      phoneNoValidate,
      passwordValidate,
      confirmPasswordValidate,
      showPassword,
      showConfirmPassword;
  Validator _validator;
  String confirmPasswordValidation(String value) {
    _globalKey.currentState.save();
    return _validator.confirmPasswordValidator(value, password);
  }

  @override
  void initState() {
    super.initState();
    style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    nameValidate = emailValidate = phoneNoValidate = passwordValidate =
        confirmPasswordValidate = showPassword = showConfirmPassword = false;
    _validator = Validator();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
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
          'Sign Up',
          style: style.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: screenHeight * 0.05),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
                    autovalidate: nameValidate, // autovalidate flag
                    validator: _validator.nameValidator, //validator function
                    onTap: () {
                      setState(() {
                        nameValidate = true;
                      });
                    },
                    onSaved: (String value) {
                      //save the final value here
                      name = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        errorStyle: style.copyWith(
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.teal,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        hintText: 'Name',
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
                    autovalidate: phoneNoValidate, // autovalidate flag
                    validator: _validator.phoneValidator, //validator function
                    onTap: () {
                      setState(() {
                        phoneNoValidate = true;
                      });
                    },
                    onSaved: (String value) {
                      //save the final value here
                      phoneNo = value;
                    },
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorStyle: style.copyWith(
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        hintText: 'Phone No.',
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
                        )),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
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
                SizedBox(height: screenHeight * 0.1),
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
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        //save data fields here to use further in app
                        Navigator.pushNamed(context, '/home_screen');
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
