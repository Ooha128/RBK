import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key, required this.label, required this.value, this.suffix})
      : super(key: key);
  final String label;
  final TextEditingController value;
  final Widget? suffix;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.label,
          style: TextStyle(
            color: Get.theme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      TextField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        controller: widget.value,
        decoration: InputDecoration(
          suffix: widget.suffix,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Get.theme.primaryColor,
            ),
          ),
        ),
      ),
    ]);
  }
}
