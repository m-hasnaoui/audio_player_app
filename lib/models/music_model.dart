import 'package:flutter/material.dart';

class Music {
  static final dbTable = "audios";
  static final dbId = "id";
  static final dbTitle = "title";
  static final dbLocation = "location";
  static final dbImage = "image";
  static final dbIsFav = "is_Fav";

  int id;
  String title,
      location,
      image;
  bool favorited;

  Music(
      {@required this.id,
        @required this.title,
        @required this.location,
        @required this.image,
        this.favorited = false});

  Music.fromMap(Map<String, dynamic> map)
      : this(
    id: map[dbId],
    title: map[dbTitle],
    location: map[dbLocation],
    image: map[dbImage],
    favorited: map[dbIsFav] == 0,
  );


  Map<String, dynamic> toMap() {
    return {
      dbId: id,
      dbTitle: title,
      dbLocation: location,
      dbIsFav: favorited ? 1 : 0,
    };
  }
}