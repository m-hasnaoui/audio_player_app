import 'package:audio_player_app/pages/home_page.dart';
import 'package:audio_player_app/pages/list_audios_page.dart';
import 'package:audio_player_app/pages/privacy_policy_page.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomePage(),
  "/liste": (BuildContext context) => ListAudios(),
  "/privacypolicy": (BuildContext context) => PrivacyPolicyPage(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.wait(
    [
      Tools.getAppInfo(),
      Future.delayed(Duration(seconds: 3)),
    ]).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Loading...')),
    );
  }
}
