import 'package:flutter/material.dart';

class MyNavigator{
  static void goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, '/home');
  }

  static void goPlaylist(BuildContext context) {
    Navigator.pushNamed(context, '/playliste');
  }

  static void goPrivacy(BuildContext context) {
    Navigator.pushNamed(context, '/privacypolicy');
  }

  static void goAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }
}