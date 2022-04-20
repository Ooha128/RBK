import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const Color colorHeader = Color(0xff172b4d);
const Color colorPrimary = Color(0xff0065ff);

class FlutterIcons {
  FlutterIcons._();

  static const _kFontFam = 'FlutterIcon';
  static const String _kFontPkg = "Hello";

  static const IconData shop =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData user =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData email =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData lock =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
