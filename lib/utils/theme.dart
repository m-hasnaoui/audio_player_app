import 'package:flutter/material.dart';


class MyColors{
  static Color primary = Color(0xffe63946);
  static Color accent = Color(0xff457b9d);
  static Color backGround = Color(0xff333533);
}

class MyTextStyles {
  static TextStyle styleAppName = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'SuezOne', color: MyColors.primary);
  static TextStyle style1normal = TextStyle(fontSize: 24);
  static TextStyle style1Bold =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}
