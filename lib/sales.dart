import 'package:flutter/material.dart';
import 'package:rbk/bottom_nav.dart';
import 'data.dart';
import 'inputform.dart';

class sales extends StatefulWidget {
  const sales();
  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  final List<Sales> SalesList = [
    Sales("12/03/2022", "113456"),
    Sales("14/04/2022", "224524"),
  ];
  void showUserDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return MyForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sales')),
      body: Stack(children: <Widget>[
        ListView.builder(
            itemCount: SalesList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildSalesCard(context, index)),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: showUserDialog,
        child: Icon(
          Icons.add,
        ),
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }

  Widget buildSalesCard(BuildContext context, int index) {
    final trip = SalesList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 5.0),
                child: Row(children: <Widget>[
                  Icon(Icons.date_range),
                  Spacer(),
                  Text(
                    "${trip.Date}",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.payment),
                    Spacer(),
                    Text(
                      "${trip.PaymentID}",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
