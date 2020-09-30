import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/utils/tools.dart';

class AudiosHelper {

  static List<Audio> audios;


  static List<String> audiosLocations = [
    "assets/audios/cool_sound_effect.mp3",
    "assets/audios/dhunki_mbkd.mp3",
    "assets/audios/islamic.mp3",
    "assets/audios/l7or.mp3",
    "assets/audios/music_box.mp3",
    "assets/audios/music_box_one.mp3",
    "assets/audios/ringtone_best_ever.mp3",
    "assets/audios/ringtone_plus_i.mp3",
    "assets/audios/ya_allah.mp3",
    "assets/audios/yaman_assayta_allaha.mp3"
  ];

  static Future<void> fillAudio(){
    audios = new List<Audio>();
    for(String item in audiosLocations){
      Audio audio = Audio(
        item,
        metas: Metas(
          id: item.split('/').last.split('.').first,
          title: item.split('/').last.split('.').first,
          artist: Strings.storeName,
          album: Tools.packageInfo.appName,
          image: MetasImage.asset("assets/icon.png"),
        ),
      );
      audios.add(audio);
    }
    return Future.value(true);
  }

 static final audios2 = <Audio>[
    Audio(
      "assets/audios/rock.mp3",
      metas: Metas(
        id: "Rock",
        title: "Rock",
        artist: "Florent Champigny",
        album: "RockAlbum",
        image: MetasImage.network(
            "https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png"),
      ),
    )
    /*,Audio.network(
     "https://d14nt81hc5bide.cloudfront.net/U7ZRzzHfk8pvmW28sziKKPzK",
     metas: Metas(
       id: "Invalid",
       title: "Invalid",
       artist: "Florent Champigny",
       album: "OnlineAlbum",
       image: MetasImage.network(
           "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
     ),
    ),
    Audio.network(
      "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3",
      metas: Metas(
        id: "Online",
        title: "Online",
        artist: "Florent Champigny",
        album: "OnlineAlbum",
        // image: MetasImage.network("https://www.google.com")
        image: MetasImage.network(
            "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
      ),
    )*/
  ];
}
