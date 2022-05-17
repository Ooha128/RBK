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
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildSalesCard(final d) {
    return Card(
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
                  const Icon(Icons.payment),
                  Spacer(),
                  Text(
                    "${d['Payment_id']}",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  List<String> s = List.from(d['fertilizers']);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Container(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Sales Details',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            color: Colors.blueAccent,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Date: ${d['Date']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text('Payment Id: ${d['Payment_id']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Container(
                                height: 300.0, // Change as per your requirement
                                width: 300.0, // Change as per your requirement
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: s.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                        title: Card(
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            s[index],
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          )),
                                    ));
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                ),
                              )
                            ],
                          ));
                    },
                  );
                },
                child: Text(
                  'More Details>>',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 1, 10, 54)),
                ))
          ],
        ),
      ),
    );
  }
}
