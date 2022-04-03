import 'package:flutter/material.dart';
import 'package:rbk/drawer.dart';
import 'package:rbk/user.dart';
import 'package:rbk/user_dialogue.dart';

class sales extends StatefulWidget {
  static const String routeName = '/sales';
  const sales({Key? key}) : super(key: key);

  @override
  _MyFlutterListState createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<sales> {
  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddUserDialog(addUserData),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Sales Details'),
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                title: Text(
                  userList[index].Fertilizer,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Id : " + userList[index].PaymentId,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                trailing: Text(
                  "Remaining Stock : " + userList[index].RemainingStock + " Kg",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
          itemCount: userList.length,
        ),
      ),
    );
  }
}
