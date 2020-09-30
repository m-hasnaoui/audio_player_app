import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:audio_player_app/widgets/appbar.dart';
import 'package:audio_player_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class PlaylistAudios extends StatefulWidget {
  @override
  _PlaylistAudiosState createState() => _PlaylistAudiosState();
}

class _PlaylistAudiosState extends State<PlaylistAudios> {

  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {

    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print("audioSessionId : $sessionId");
    }));

    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));

    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDarawer(),
      body: Column(
        children: [
          MyAppBar(
            title: Text(Tools.packageInfo.appName),
          ),
          Expanded(
            child: Column(
              children: [
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
