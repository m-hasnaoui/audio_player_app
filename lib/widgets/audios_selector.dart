import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongsSelector extends StatelessWidget {
  final Playing playing;
  final List<Audio> audios;
  final VoidCallback showOptions;
  final Function(List<Audio>, int) onSelected;

  SongsSelector(
      {@required this.playing,
      @required this.audios,
      @required this.onSelected, this.showOptions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: this.audios.length,
        itemBuilder: (BuildContext context, int position) {
          final item = this.audios[position];
          final isPlaying = item.path == this.playing?.audio?.assetAudioPath;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            decoration: new BoxDecoration(
                color: isPlaying ? MyColors.blueBlackCont : Colors.transparent,
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    isPlaying ? MyColors.blueBlackCont : Colors.transparent,
                    Colors.transparent,
                  ],
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft
                )),
            child: ListTile(
              onTap: () {
                this.onSelected(this.audios, position);
              },
              leading: CircleAvatar(
                backgroundColor:
                    isPlaying ? MyColors.celeste : Colors.transparent,
                radius: 25,
                backgroundImage: item.metas.image?.type == ImageType.network
                    ? Image.network(
                        item.metas.image.path,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ).image
                    : Image.asset(
                        item.metas.image.path,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ).image,
              ),
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 220,
                                      child: Text('${item.metas.title}',
                                          style: MyTextStyles.styleTitleSong
                                              .apply(
                                                  color: isPlaying
                                                      ? MyColors.celeste
                                                      : Colors.white)),
                                    ),
                                    // SizedBox(height: 2),
                                    Container(
                                      width: 180,
                                      child: Text(
                                          '${item.metas.album} • ${item.metas.artist}',
                                          style: MyTextStyles.styleArtista
                                              .apply(color: MyColors.gris),
                                          maxLines: 1),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  FontAwesomeIcons.ellipsisV /*FontAwesomeIcons.play*/,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  showOptions();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
