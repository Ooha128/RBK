import 'package:flutter/material.dart';

class SampleDemo extends StatefulWidget {
  @override
  _SampleDemoState createState() => _SampleDemoState();
}

class _SampleDemoState extends State<SampleDemo> {
  String title = "0";
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: !isEditable
              ? Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              : TextFormField(
                  initialValue: title,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {
                    setState(() => {isEditable = false, title = value});
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          setState(() => {
                isEditable = true,
              });
        },
      )
    ]);
  }
}
