import 'package:audio_player_app/utils/strings.dart';
import 'package:audio_player_app/utils/tools.dart';
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
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(Tools.packageInfo.appName),
      ),
      body: Container(
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
              onPressed: () {},
            ),
            GFButton(
              child: Text(Strings.rate),
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              onPressed: () {},
            ),
            GFButton(
              child: Text(Strings.more),
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
