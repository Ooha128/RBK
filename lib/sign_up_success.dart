import 'package:flutter/material.dart';

class AlertSignIn extends StatefulWidget {
  final String _titleTxt;
  final String _descriptionText;
  final String _btnText;

  const AlertSignIn(
    this._titleTxt,
    this._descriptionText,
    this._btnText, {
    Key? key,
  }) : super(key: key);

  @override
  State<AlertSignIn> createState() => _AlertSignInState();
}

class _AlertSignInState extends State<AlertSignIn> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'sign_up_dialog',
      child: AlertDialog(
        title: Text(widget._titleTxt),
        content: Text(widget._descriptionText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(widget._btnText),
          ),
        ],
      ),
    );
  }
}
