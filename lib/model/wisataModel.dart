// class Wisata1 {
//   final Wisata wisata;

//   Wisata1({this.wisata});
//   factory Wisata1.fromJson(Map<String, dynamic> json) {
//     wisata:
//     Wisata.fromJson(json['wisata']);
//   }
// }

import 'package:flutter/foundation.dart';

class Wisata {
  final int id;
  final String nama;
  final String alamat;
  final String deskripsi;
  final String latitude;
  final String longitude;
  final Categori categories;
  List<Gambar> photos;

  Wisata({
    this.id,
    this.nama,
    this.alamat,
    this.deskripsi,
    this.latitude,
    this.longitude,
    this.categories,
    this.photos,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return new Wisata(
      id: json['id'],
      nama: json['nama'],
      alamat: json['alamat'],
      deskripsi: json['deskripsi'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      categories: Categori.fromJsn(json['categories']),
      photos: List<Gambar>.from(json["photos"].map((x) => Gambar.fromJson(x))),
    );
  }
}

class Gambar {
  final String photos;

  Gambar({this.photos});
  factory Gambar.fromJson(Map<String, dynamic> json) {
    return new Gambar(photos: json['path']);
  }
}

class Categori {
  final String categories;

  Categori({this.categories});

  factory Categori.fromJsn(Map<String, dynamic> json) {
    return new Categori(categories: json['categori']);
  }
}

// class User {
//   final int id;
//   final String name;
//   final String email;
//   User({
//     this.id,
//     this.name,
//     this.email,
//   });

//   factory User.fromJson(Map<dynamic, dynamic> json) {
//     return new User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }
