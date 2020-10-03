import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode loopMode;
  final bool isPlaylist;
  final Function() onPrevious;
  final Function() onPlay;
  final Function() onNext;
  final Function() toggleLoop;
  final Function(bool) toggleRandom;
  final Function() onStop;
  final bool random;

  PlayingControls({
    @required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    @required this.onPlay,
    this.onNext,
    this.onStop,
    this.toggleRandom,
    this.random,
  });


  Widget _loopIcon(BuildContext context) {
    final iconSize = 20.0;
    if (loopMode == LoopMode.none) {
      return Icon(
        FontAwesomeIcons.redo,
        size: iconSize,
        color: Colors.grey,
      );
    } else if (loopMode == LoopMode.playlist) {
      return Icon(
        FontAwesomeIcons.redo,
        size: iconSize,
        color: MyColors.rosado,
      );
    } else {
      //single
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            FontAwesomeIcons.redo,
            size: iconSize,
            color: MyColors.gris,
          ),
          Center(
            child: Text(
              "1",
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: MyColors.gris),
            ),
          ),
        ],
      );
    }
  }

  Widget _randomIcon(BuildContext context) {
    final iconSize = 20.0;
    if (random) {
      return Icon(
        FontAwesomeIcons.random,
        size: iconSize,
        color: MyColors.gris,
      );
    } else {
      return Icon(
        FontAwesomeIcons.random,
        size: iconSize,
        color: MyColors.rosado,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              toggleLoop();
            },
            child: _loopIcon(context),
          ),
          SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: isPlaylist ? this.onPrevious : null,
            icon: Icon(
              FontAwesomeIcons.backward,
              color: MyColors.gris,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: this.onPlay,
            icon: Icon(
              isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
              color: MyColors.gris,
              size: 32,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: isPlaylist ? this.onNext : null,
            icon: Icon(
              FontAwesomeIcons.forward,
              color: MyColors.gris,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          /*if (onStop != null)
            IconButton(
              onPressed: this.onStop,
              icon: Icon(
                FontAwesomeIcons.random,
                color: random ? MyColors.rosado : MyColors.gris,
                size: 25,
              ),
            ),*/
          GestureDetector(
            onTap: () {
              toggleRandom(random);
            },
            child: _randomIcon(context),
          ),
        ],
      ),
    );
  }
}
