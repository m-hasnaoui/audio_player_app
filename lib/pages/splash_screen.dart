import 'package:audio_player_app/pages/home_page.dart';
import 'package:audio_player_app/utils/audios_helper.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    /*Future.wait(
        [
          Tools.getAppInfo(),
          AudiosHelper.fillAudios(),
          Future.delayed(Duration(seconds: 3)),
        ]).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });*/
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AudiosHelper.fillAudios(),
        builder: (BuildContext context, snapshot) {
          Tools.getAppInfo();
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Center(
                child: GFButton(
                  child: Text('Start'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  },
                ),
              );
            } else {
              return Center(child: Text('Feild to load audios 💔'));
            }
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading...'),
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
        },
      ),
    );
  }
}
