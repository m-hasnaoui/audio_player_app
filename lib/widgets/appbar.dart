import 'package:audio_player_app/utils/theme.dart';
import 'package:audio_player_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/AppBar/gf_AppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final Color color;
  final List<Widget> actions;

  const MyAppBar(
      {Key key,
      this.title,
      this.actions,
      this.leading,
      this.color})
      : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return /*Column(
      children: [*/
        GFAppBar(
          backgroundColor: widget.color ?? MyColors.blueBlackBackground,
          leading: widget.leading ??
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: SvgPicture.asset('assets/icons/burger_menu.svg', color: MyColors.gris, width: 25.0),
                padding: EdgeInsets.all(12.0),
              ),
          title: widget.title ?? Text(Tools.packageInfo.appName, style: MyTextStyles.title,),
          centerTitle: true,
          actions: widget.actions ?? [IconButton(onPressed: (){},icon: Icon(FontAwesomeIcons.gift, color: MyColors.gris,))],
          elevation: 0.0,
        )/*,
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            color: widget.color ?? MyColors.blueBlackBackground,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100.0),
              bottomLeft: Radius.circular(100.0),
            ),
          ),
          child: Center(child: widget.subTitle),
        ),
      ],
    )*/;
  }
}
