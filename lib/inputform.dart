import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _productController;
  static List<String> salesList = [''];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _productController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Sales Details Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name textfield
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter Date'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _productController,
                  decoration: InputDecoration(hintText: 'Payment ID'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add sales',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getsales(),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    //Need to Enter
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection('sales').add({
                            'Date': _nameController.text,
                            'Payment_id': _productController.text,
                            'fertilizers': [],
                          });
                          FirebaseFirestore.instance
                              .collection('sales')
                              .where('Payment_id',
                                  isEqualTo: _productController.text)
                              .get()
                              .then((v) {
                            v.docs.forEach((element) {
                              FirebaseFirestore.instance
                                  .collection('sales')
                                  .doc(element.id)
                                  .update({
                                    'fertilizers':
                                        FieldValue.arrayUnion(salesList)
                                  })
                                  .then(
                                    (value) => Get.snackbar('Success',
                                        'Details added Successfully'),
                                  )
                                  .catchError((error) =>
                                      print("Failed to update: $error"));
                            });
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Add Sales',
                            style: TextStyle(fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /// get firends text-fields
  List<Widget> _getsales() {
    List<Widget> salesTextFields = [];
    for (int i = 0; i < salesList.length; i++) {
      salesTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: saleTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last sales row
            _addRemoveButton(i == salesList.length - 1, i),
          ],
        ),
      ));
    }
    return salesTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all sales textfields
          salesList.insert(salesList.length - 1, '');
        } else
          salesList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class saleTextFields extends StatefulWidget {
  final int index;
  saleTextFields(this.index);
  @override
  _saleTextFieldsState createState() => _saleTextFieldsState();
}

class _saleTextFieldsState extends State<saleTextFields> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _MyFormState.salesList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _MyFormState.salesList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Fertilizers name'),
    );
  }
}
