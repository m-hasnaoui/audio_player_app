import 'dart:io';

import 'package:audio_player_app/utils/strings.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

class Tools{
  static PackageInfo packageInfo = PackageInfo(
    appName: ' ',
    packageName: ' ',
    version: ' ',
    buildNumber: ' ',
  );

  static Future<bool> copyDataBase() async {
    String path = '';
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      String assetFullName = 'assets/audios_db.db';
      /* final Map<String, dynamic> manifestMap = jsonDecode(await manifestContent);

      final databasesPaths = manifestMap.keys
      .where((String key) => key.contains('databases/'))
      .where((String key) => key.contains('.db'))
      .toList();

      print("Databases :::::::::::::::::::::::::: $databasesPaths"); */

      // Directory(documentsDirectory.path + '/myData').createSync();

      path = join(documentsDirectory.path,assetFullName.split('/').last);
      // Only copy if the database doesn't exist
      //if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      // Load database from asset and copy
      ByteData data = await rootBundle.load(assetFullName);
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
      print("==============================> Item Copied : $path");

      /*  }else{
        print("==============================> Database Already Exist!");
      } */
    } catch (e) {
      print("Erreur Copie : $e");
    }
    return true;
  }

  static Future<bool> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
    print('===========> Package info exucited');
    return true;
  }

  static launchURLRate() async {
    var url = 'https://play.google.com/store/apps/details?id=' +
        Tools.packageInfo.packageName;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchURLMore() async {
    var url;
    if (Strings.storeId != "") {
      url = 'https://play.google.com/store/apps/dev?id=' + Strings.storeId;
    } else {
      url = 'https://play.google.com/store/apps/developer?id=' +
          Strings.storeName.split(' ').join('+');
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}