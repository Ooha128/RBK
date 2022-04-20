// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rbk/textfield.dart';
import 'package:rbk/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:rbk/homePage.dart';

enum Login {
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET,
}

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String verificationID = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  Login currentState = Login.SHOW_MOBILE_ENTER_WIDGET;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: currentState == Login.SHOW_MOBILE_ENTER_WIDGET
            ? showPhoneWidget(context)
            : showOtpWidget(context),
      ),
    );
  }

  showPhoneWidget(context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: <Widget>[
          Container(
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/light-1.png'))),
                  ),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/light-2.png'))),
                  ),
                ),
                Positioned(
                  right: 40,
                  top: 40,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/clock.png'))),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone_android),
                              border: InputBorder.none,
                              hintText: "Phone number",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: AnimatedButton(
                    height: 50,
                    width: 200,
                    text: 'Login',
                    isReverse: true,
                    selectedTextColor: Colors.black,
                    transitionType: TransitionType.LEFT_TO_RIGHT,
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(143, 148, 251, 1),
                      Color.fromRGBO(143, 148, 251, .6),
                    ]),
                    borderRadius: 30,
                    borderColor: Color.fromARGB(153, 69, 77, 235),
                    borderWidth: 2,
                    onPress: () async {
                      await _auth.verifyPhoneNumber(
                          phoneNumber: "+91${_phoneController.text}",
                          verificationCompleted: (phoneAuthCredential) async {},
                          verificationFailed: (verificationFailed) {
                            setState(() {});
                            print(verificationFailed);
                          },
                          codeSent: (verificationID, resendingToken) async {
                            setState(() {
                              currentState = Login.SHOW_OTP_FORM_WIDGET;
                              this.verificationID = verificationID;
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationID) async {});
                    },
                  ),
                )
              ]))
        ]))));
  }

  showOtpWidget(context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: <Widget>[
          Container(
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/light-1.png'))),
                  ),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/light-2.png'))),
                  ),
                ),
                Positioned(
                  right: 40,
                  top: 40,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/clock.png'))),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.security),
                            border: InputBorder.none,
                            hintText: "Enter OTP",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                        keyboardType: TextInputType.number,
                        controller: _otpController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                  child: InkWell(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(153, 72, 80, 236),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                          "Verify",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        AuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationID,
                                smsCode: _otpController.text);
                        signInWithPhoneAuthCred(phoneAuthCredential);
                      }))
            ]),
          )
        ]))));
  }

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }
}
