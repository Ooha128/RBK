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
    List<String> s = d['fertilizers'];
    return Card(
        child: InkWell(
      onTap: () => {
        AlertDialog(
            title: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        fontWeight: FontWeight.bold, fontSize: 20)),
                Text('Payment Id: ${d['Payment_id']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  height: 300.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: s.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              s[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
            ))
      },
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
    ));
  }
}
