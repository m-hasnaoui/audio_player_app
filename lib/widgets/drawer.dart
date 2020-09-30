import 'package:audio_player_app/utils/theme.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:getwidget/getwidget.dart';

import '../utils/strings.dart';
import '../utils/strings.dart';
import '../utils/strings.dart';

class MyDarawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 1.3,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -(MediaQuery.of(context).size.width / 3),
                    child: Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: MyColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            'assets/icon.png',
                            width: 100.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            Tools.packageInfo.appName,
                            style: MyTextStyles.styleAppName
                                .apply(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      ListTile(
                        leading: SvgPicture.asset('assets/icons/home.svg', height: 25.0),
                        title: Text(Strings.home, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: SvgPicture.asset('assets/icons/rate_us.svg', height: 25.0),
                        title: Text(Strings.rate, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: SvgPicture.asset('assets/icons/more_apps.svg', height: 25.0),
                        title: Text(Strings.more, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: SvgPicture.asset('assets/icons/about_us.svg', height: 25.0),
                        title: Text(Strings.about, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Developed with 🤍',
                style: TextStyle(color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }
}
