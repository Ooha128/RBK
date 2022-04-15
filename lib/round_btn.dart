// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rbk/HomeScreen.dart';
import 'package:rbk/homePage.dart';
import 'package:rbk/theme_data.dart';
import 'package:rbk/sign_up_success.dart';

class CustomButton extends StatelessWidget {
  final int _iD;
  final String _btnText;
  // final String _inputUsername;
  // final String _inputPassword;
  const CustomButton(this._iD, this._btnText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 45),
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Colors.white,
        child: Text(
          _btnText,
          style: TextStyle(fontSize: 16, color: accentColorC),
        ),
        onPressed: () {
          if (_iD == 1) {
            Navigator.push(context,
                PageRouteBuilder(pageBuilder: (context, _, __) => homePage()));
          } else {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, _, __) => const AlertSignIn(
                  'Successful',
                  'Sign Up was successful',
                  'Ok',
                ),
                opaque: false,
              ),
            );
          }
        },
      ),
    );
  }
}
