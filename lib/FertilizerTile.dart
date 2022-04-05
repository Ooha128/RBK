import 'package:flutter/material.dart';
import 'package:rbk/editableField.dart';

class FertilizerTile extends StatelessWidget {
  final String avb;
  final String title;
  final String company;
  final Color color;
  const FertilizerTile({
    Key? key,
    required this.avb,
    required this.title,
    required this.company,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
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
                              style: const TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                          const Text(
                            'Availability:',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          Container(
                            child: SampleDemo(),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
