import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String? title;
  final AssetImage a;
  final Widget path;
  const CategoryCard({
    Key? key,
    required this.a,
    this.title,
    required this.path,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    Color shadowColor = const Color(0xffe6e6e6);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
            color: shadowColor,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget.path));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image(
                  image: widget.a,
                  height: 110,
                  width: 110,
                ),
                const Spacer(),
                Text(
                  widget.title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 15,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
