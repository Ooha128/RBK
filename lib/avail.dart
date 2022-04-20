import 'package:flutter/material.dart';
import 'package:rbk/FertilizerTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Avail extends StatefulWidget {
  String name = "";
  String company = "";
  Avail(String n, String c) {
    name = n;
    company = c;
  }
  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<Avail> {
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

    var AvaController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 200,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Availability',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Availability', AvaController),
            ElevatedButton(
                child: Text('Update'),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('fertilizers')
                      .where('Name', isEqualTo: widget.name)
                      .where('Company', isEqualTo: widget.company)
                      .get()
                      .then((v) {
                    v.docs.forEach(
                      (element) {
                        print(element.id);
                        FirebaseFirestore.instance
                            .collection('fertilizers')
                            .doc(element.id)
                            .update(
                                {'Availability': int.parse(AvaController.text)})
                            .then((value) => print("Updated"))
                            .catchError((error) =>
                                print("Failed to update user: $error"));
                      },
                    );
                  });
                })
          ],
        ),
      ),
    );
  }
}
