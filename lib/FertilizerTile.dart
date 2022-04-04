import 'package:flutter/material.dart';

class FertilizerTile extends StatelessWidget {
  final String avb;
  final String title;
  final String assetPath;
  final String company;
  final Color color;
  const FertilizerTile({
    Key? key,
    required this.avb,
    required this.title,
    required this.assetPath,
    required this.company,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),
      height: MediaQuery.of(context).size.height * 75,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Image.asset(
                    assetPath,
                    height: 100,
                    width: 80,
                    alignment: Alignment.center,
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(company,
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
                        Text(
                          'Availability:',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.normal),
                        ),
                        buildEdit(),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildEdit() {
  bool _isEnable = false;
  return Row(
    children: <Widget>[
      Container(
        width: 100,
        child: TextField(
          decoration: const InputDecoration(
            hintText: "0",
            hintStyle: TextStyle(color: Colors.black),
          ),
          enabled: _isEnable,
        ),
      ),
      IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            setState(() {
              _isEnable = true;
            });
          })
    ],
  );
}

void setState(Null Function() param0) {}
