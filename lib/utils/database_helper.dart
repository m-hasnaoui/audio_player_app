import 'dart:io';

import 'package:audio_player_app/models/music_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {

  DatabaseProvider();

  //final TemplateDatabaseProvider db = TemplateDatabaseProvider('');

  Database _database;

/* Future<Database> _getDb() async {
  if (_database != null)
  return _database;
  // if _database is null we instantiate it
  _database = await initDB();
  return _database;
} */

  Future<Database> getdatabase() async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'audios_db.db');
    return await openDatabase(path);
  }

  Future<List<Music>> getAllMusics() async {
    final db = await getdatabase();
    //print('from getAllMusics : path = ${this.path}');
    // Building SELECT * FROM TABLE WHERE ID IN (id1, id2, ..., idn)
    List<Map> jsons = await db.rawQuery('SELECT * FROM ${Music.dbTable}');
    //print('${jsons.length} rows retrieved from db!');
    return jsons.map((json) => Music.fromMap(json)).toList();
  }

  Future<List<Music>> getFavMusics() async {
    final db = await getdatabase();
    //print('from getAllMusics : path = ${this.path}');
    // Building SELECT * FROM TABLE WHERE ID IN (id1, id2, ..., idn)
    List<Map> jsons = await db.rawQuery(
        'SELECT * FROM ${Music.dbTable} WHERE ${Music.dbIsFav} = ?', [1]);
    //print('${jsons.length} rows retrieved from db!');
    return jsons.map((json) => Music.fromMap(json)).toList();
  }

  Future<List<Music>> searchMusics(String keyword) async {
    final db = await getdatabase();
    //print('from getAllMusics : path = ${this.path}');
    // Building SELECT * FROM TABLE WHERE ID IN (id1, id2, ..., idn)
    List<Map> jsons = await db.rawQuery(
        'SELECT * FROM ${Music.dbTable} WHERE ${Music
            .dbTitle} LIKE "%$keyword%"');
    //print('${jsons.length} rows retrieved from db!');
    return jsons.map((json) => Music.fromMap(json)).toList();
  }

  Future<List<Music>> searchFavMusics(String keyword) async {
    final db = await getdatabase();
    //print('from getAllMusics : path = ${this.path}');
    // Building SELECT * FROM TABLE WHERE ID IN (id1, id2, ..., idn)
    List<Map> jsons = await db.rawQuery(
        'SELECT * FROM ${Music.dbTable} WHERE ${Music
            .dbTitle} LIKE "%$keyword%" AND ${Music.dbIsFav} = "1"');
    //print('${jsons.length} rows retrieved from db!');
    return jsons.map((json) => Music.fromMap(json)).toList();
  }

  Future<int> updateFav(int myid,bool operation) async {

    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await getdatabase();

    // row to update
    Map<String, dynamic> row = {
      Music.dbIsFav: operation,
    };

    // We'll update the first row just as an example
    int id = myid;

    // do the update and get the number of affected rows
    int updateCount = await db.update(
        Music.dbTable,
        row,
        where: '${Music.dbId} = ?',
        whereArgs: [id]);

    // show the results: print all rows in the db
    print(await db.query(Music.dbTable));
    return updateCount;

  }

  Future<int> switchFav(int id, bool b) async{
    Database db = await getdatabase();
    int updateCount = await db.rawUpdate('''
    UPDATE ${Music.dbTable} 
    SET ${Music.dbIsFav} = ?
    WHERE ${Music.dbId} = ?
    ''',
        [b ? 0 : 1 , id]);

    print('b =====================> $b');
    print('id =====================> $id');
    print('=================RESULT rawUpdate====================> $updateCount');

    return updateCount;
  }

  /* static TemplateDatabaseProvider get(String mypath) {

    return db;
  } */

  Future<Music> getMusic(String id) async{
    var db = await getdatabase();
    var result = await db.rawQuery(
        'SELECT * FROM ${Music.dbTable} WHERE ${Music.dbId} = "$id"');
    if(result.length == 0)return null;
    return new Music.fromMap(result[0]);
  }
}
