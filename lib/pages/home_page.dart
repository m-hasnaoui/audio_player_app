import 'package:audio_player_app/utils/navigator.dart';
import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:audio_player_app/widgets/appbar.dart';
import 'package:audio_player_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDarawer(),
      body: Column(
        children: [
          MyAppBar(
            title: Text(
              Tools.packageInfo.appName,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  color: MyColors.gris),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*GFButton(
                    child: Text(Strings.listen),
                    size: GFSize.LARGE,
                    shape: GFButtonShape.pills,
                    color: MyColors.rosado,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                    icon: SvgPicture.asset('assets/icons/home.svg'),
                    onPressed: () {
                      MyNavigator.goList(context);
                    },
                  ),
                  SizedBox(height: 50.0),
                  GFButton(
                    child: Text(Strings.rate),
                    size: GFSize.LARGE,
                    color: MyColors.rosado,
                    onPressed: () {},
                  ),*/
                  GredientButton(
                    onPressed: () {
                      MyNavigator.goPlaylist(context);
                    },
                    splashColor: MyColors.rosado,
                    colors: [
                      Color(0xFFC33764),
                      Color(0xFF1D2671),
                    ],
                    title: Strings.listen,
                  ),
                  SizedBox(height: 50.0),
                  GredientButton(
                    onPressed: () {},
                    splashColor: MyColors.rosado,
                    colors: [
                      Color(0xFFC33764),
                      Color(0xFF1D2671),
                    ],
                    title: Strings.rate,
                  ),
                  SizedBox(height: 10.0),
                  GredientButton(
                    onPressed: () {},
                    splashColor: MyColors.rosado,
                    colors: [
                      Color(0xFFC33764),
                      Color(0xFF1D2671),
                    ],
                    title: Strings.more,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
