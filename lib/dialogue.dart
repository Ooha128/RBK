import 'package:flutter/material.dart';
import 'package:rbk/FertilizerTile.dart';

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
            buildTextField('msp value', mspController),
            ElevatedButton(
              onPressed: () {
                final user = FertilizerTile(
                    title: FertilizerController.text,
                    company: CompanyController.text,
                    msp: mspController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
