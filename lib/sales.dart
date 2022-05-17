import 'package:flutter/material.dart';
import 'package:rbk/homePage.dart';
import 'inputform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class sales extends StatefulWidget {
  const sales();
  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
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
      appBar: AppBar(
        title: Text('Sales'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.home)),
        ],
      ),
      body: Stack(children: <Widget>[
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('sales').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Container(
                  child: Center(child: buildSalesCard(document)),
                );
              }).toList(),
            );
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: showUserDialog,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildSalesCard(final d) {
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
                    "${d['Date']}",
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
                      "${d['Payment_id']}",
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
