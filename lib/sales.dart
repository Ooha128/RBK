import 'package:flutter/material.dart';
import 'package:rbk/drawer.dart';
import 'data.dart';
import 'inputform.dart';

class sales extends StatefulWidget {
  static const String routeName = '/homePage';

  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  final List<Sales> SalesList = [
    Sales("12/03/2022", "113456"),
    Sales("14/04/2022", "224524"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sales')),
        drawer: MyDrawer(),
        body: Stack(children: <Widget>[
          new ListView.builder(
              itemCount: SalesList.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildSalesCard(context, index)),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyForm()),
                  );
                },
                child: const Text('Add Sales', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          )
        ]));
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
