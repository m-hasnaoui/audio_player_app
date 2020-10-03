import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/models/music_model.dart';
import 'package:audio_player_app/utils/database_helper.dart';
import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/utils/tools.dart';

class AudiosHelper {
  static List<Music> musics = new List<Music>();
  static List<Audio> audios;

  static Future<bool> fillAudios() async {
    audios = new List<Audio>();

    await Tools.copyDataBase();

    DatabaseProvider dbProvider = new DatabaseProvider();

    dbProvider.getAllMusics().then((onValue) {
      musics = onValue;
    });

    await Future.forEach(musics, (item) async {
      Audio audio = Audio(
        item.location,
        metas: Metas(
          id: item.title.split('/').last.split('.').first,
          title: item.title.split('/').last.split('.').first,
          artist: Strings.storeName,
          album: Tools.packageInfo.appName,
          image: MetasImage.asset(item.image),
        ),
      );
      audios.add(audio);
    });

    /*for (Music item in musics) {
      Audio audio = Audio(
        item.location,
        metas: Metas(
          id: item.title.split('/').last.split('.').first,
          title: item.title.split('/').last.split('.').first,
          artist: Strings.storeName,
          album: Tools.packageInfo.appName,
          image: MetasImage.asset(item.image),
        ),
      );
      audios.add(audio);
      print('==========================> AUDIO ADDED');
    }*/
    return true;
  }
}
