import 'package:flutter/material.dart';
import 'package:rbk/user.dart';

class AddUserDialog extends StatefulWidget {
  final Function(User) addUser;

  AddUserDialog(this.addUser);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
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
    var RemainingStockController = TextEditingController();
    var PaymentIdController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Sales Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Fertilizer', FertilizerController),
            buildTextField('Remaining Stock', RemainingStockController),
            buildTextField('Payment Id', PaymentIdController),
            ElevatedButton(
              onPressed: () {
                final user = User(FertilizerController.text,
                    RemainingStockController.text, PaymentIdController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: Text('Add sales'),
            ),
          ],
        ),
      ),
    );
  }
}
