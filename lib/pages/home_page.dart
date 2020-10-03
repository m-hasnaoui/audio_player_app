import 'package:audio_player_app/utils/navigator.dart';
import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:audio_player_app/widgets/appbar.dart';
import 'package:audio_player_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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
          MyAppBar(),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GFButton(
                    child: Text(Strings.listen),
                    size: GFSize.LARGE,
                    shape: GFButtonShape.pills,
                    color: MyColors.rosado,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                    onPressed: () {
                      MyNavigator.goPlaylist(context);
                    },
                  ),
                  SizedBox(height: 50.0),
                  GFButton(
                    child: Text(Strings.rate),
                    size: GFSize.LARGE,
                    color: MyColors.rosado,
                    type: GFButtonType.outline,
                    shape: GFButtonShape.pills,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Cairo', color: MyColors.rosado),
                    onPressed: () {},
                  ),
                  GFButton(
                    child: Text(Strings.more),
                    size: GFSize.LARGE,
                    color: MyColors.rosado,
                    type: GFButtonType.outline,
                    shape: GFButtonShape.pills,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Cairo', color: MyColors.rosado),
                    onPressed: () {},
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
