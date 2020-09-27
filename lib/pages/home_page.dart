import 'package:audio_player_app/utils/navigator.dart';
import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/utils/theme.dart';
import 'package:audio_player_app/utils/tools.dart';
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
          MyAppBar(
            title: Text(Tools.packageInfo.appName),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GFButton(
                    child: Text(Strings.listen),
                    size: GFSize.LARGE,
                    shape: GFButtonShape.pills,
                    color: MyColors.accent,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                    onPressed: () {
                      MyNavigator.goList(context);
                    },
                  ),
                  GFButton(
                    child: Text(Strings.rate),
                    size: GFSize.LARGE,
                    shape: GFButtonShape.pills,
                    color: MyColors.accent,
                    onPressed: () {
                    },
                  ),
                  GFButton(
                    child: Text(Strings.more),
                    size: GFSize.LARGE,
                    shape: GFButtonShape.pills,
                    color: MyColors.accent,
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
