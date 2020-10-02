import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/pages/home_page.dart';
import 'package:audio_player_app/pages/playlist_page.dart';
import 'package:audio_player_app/pages/privacy_policy_page.dart';
import 'package:audio_player_app/pages/splash_screen.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomePage(),
  "/playliste": (BuildContext context) => PlaylistAudios(),
  "/playing": (BuildContext context) => PlaylistAudios(),
  "/privacypolicy": (BuildContext context) => PrivacyPolicyPage(),
};

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    print(notification.audioId);
    return true;
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Cairo',
        canvasColor: MyColors.blueBlackBackground,
      ),
      routes: routes,
      home: SplashScreen(),
    );
  }
}