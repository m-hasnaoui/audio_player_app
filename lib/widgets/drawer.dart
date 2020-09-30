import 'package:audio_player_app/utils/theme.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:getwidget/getwidget.dart';

class MyDarawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 1.5,
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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'V ${Tools.packageInfo.version}',
                            style: TextStyle(color: Colors.white),
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
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/home.svg', height: 25.0),
                      title: Text('Home', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/rate_us.svg', height: 25.0),
                      title: Text('Rate Us', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/more_apps.svg', height: 25.0),
                      title: Text('More Apps', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/about_us.svg', height: 25.0),
                      title: Text('About', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Developed with 🤍',
                style: TextStyle(color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
