import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/widgets/appbar.dart';
import 'package:audio_player_app/widgets/audio_controllers.dart';
import 'package:audio_player_app/widgets/audios_selector.dart';
import 'package:audio_player_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'package:audio_player_app/utils/audios_helper.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PlaylistAudios extends StatefulWidget {
  @override
  _PlaylistAudiosState createState() => _PlaylistAudiosState();
}

class _PlaylistAudiosState extends State<PlaylistAudios> {
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  final List<StreamSubscription> _subscriptions = [];
  bool sizedB = false;

  @override
  void initState() {
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print("==================> audioSessionId : $sessionId");
    }));

    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));

    /*_assetsAudioPlayer.open(
      Playlist(audios: AudiosHelper.audios),
      showNotification: true,
      headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
      audioFocusStrategy: AudioFocusStrategy.request(resumeAfterInterruption: true,),
      autoStart: false,
    );*/

    super.initState();
  }

  @override
  void dispose() {
    // _assetsAudioPlayer.dispose();
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  SheetController sheetController = new SheetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDarawer(),
      body: Column(
        children: [
          MyAppBar(
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.angleLeft,
                color: MyColors.gris,
                size: 25.0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(Strings.playlist, style: MyTextStyles.title),
            actions: [
              IconButton(
                icon: Icon(FontAwesomeIcons.search, color: MyColors.gris, size: 20.0,),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.ellipsisV, color: MyColors.gris, size: 20.0,),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: SlidingSheet(
              controller: sheetController,
              elevation: 8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              cornerRadius: 15,
              snapSpec: const SnapSpec(
                // Enable snapping. This is true by default.
                snap: true,
                // Set custom snapping points.
                snappings: [0.0, 1.0, 1.0],
                // Define to what the snappings relate to. In this case,
                // the total available space that the sheet can expand to.
                positioning: SnapPositioning.relativeToSheetHeight,
              ),
              body: _assetsAudioPlayer.builderCurrent(
                  builder: (BuildContext context, Playing playing) {
                return Column(
                  children: [
                    Expanded(
                      child: SongsSelector(
                        audios: AudiosHelper.audios,
                        onSelected: (myAudios, index) async {
                          try {
                            await _assetsAudioPlayer.open(
                              Playlist(audios: myAudios),
                              showNotification: true,
                              playInBackground: PlayInBackground.enabled,
                              headPhoneStrategy:
                                  HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                              audioFocusStrategy: AudioFocusStrategy.request(
                                resumeAfterInterruption: true,
                              ),
                              autoStart: false,
                            );
                            _assetsAudioPlayer.playlistPlayAtIndex(index);
                            sheetController.expand();
                            setState(() {
                              sizedB = true;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        playing: playing,
                        showOptions: () => showAsBottomSheet(),
                      ),
                    ),
                    SizedBox(
                      height: sizedB ? 120.0 : 0.0,
                    )
                  ],
                );
              }),
              builder: (context, state) {
                // This is the content of the sheet that will get
                // scrolled, if the content is bigger than the available
                // height of the sheet.
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: MyColors.blueBlackBar
                  ),
                  child: _assetsAudioPlayer.builderLoopMode(
                    builder: (context, loopMode) {
                      return PlayerBuilder.isPlaying(
                          player: _assetsAudioPlayer,
                          builder: (context, isPlaying) {
                            return PlayingControls(
                              loopMode: loopMode,
                              isPlaying: isPlaying,
                              isPlaylist: true,
                              onStop: () {
                                _assetsAudioPlayer.stop();
                              },
                              toggleLoop: () {
                                _assetsAudioPlayer.toggleLoop();
                              },
                              onPlay: () {
                                _assetsAudioPlayer.playOrPause();
                              },
                              onNext: () {
                                //_assetsAudioPlayer.forward(Duration(seconds: 10));
                                _assetsAudioPlayer.next(
                                    keepLoopMode: true
                                  /*keepLoopMode: false*/);
                              },
                              onPrevious: () {
                                _assetsAudioPlayer.previous(
                                  /*keepLoopMode: false*/);
                              },
                              random: true,
                              toggleRandom: (random){
                                random = random ? true : false;
                              },
                            );
                          });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showAsBottomSheet() async {
    final result = await showSlidingBottomSheet(
        context,
        builder: (context) {
          return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: 400,
                child: Center(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.pop(context, 'This is the result.'),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'This is the content of the sheet',
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
    );

    print(result); // This is the result.
  }

}
