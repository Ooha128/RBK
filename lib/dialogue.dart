import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rbk/FertilizerTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserDialog1 extends StatefulWidget {
  final Function(FertilizerTile) addUser;

  AddUserDialog1(this.addUser);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog1> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var FertilizerController = TextEditingController();
    var CompanyController = TextEditingController();
    var mspController = TextEditingController();
    var AvaController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Fertilizer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Fertilizer', FertilizerController),
            buildTextField('Company', CompanyController),
            buildTextField('Availability', AvaController),
            buildTextField('msp value', mspController),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('fertilizers').add({
                  'Name': FertilizerController.text,
                  'Company': CompanyController.text,
                  'Availability': int.parse(AvaController.text),
                  'MSP': int.parse(mspController.text)
                });
                Fluttertoast.showToast(
                    msg: "Fertilizer Added Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.pop(context);
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
