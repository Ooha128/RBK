import 'package:flutter/material.dart';

class FertilizerTile extends StatelessWidget {
  final Color color;
  final String title;
  final String assetPath;
  const FertilizerTile({
    Key? key,
    required this.color,
    required this.title,
    required this.assetPath,
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
      height: 200,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  assetPath,
                  height: 100,
                  width: 80,
                  alignment: Alignment.center,
                ),
                Text(title, style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
