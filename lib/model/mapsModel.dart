import 'dart:ffi';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;

  User({this.id, this.name, this.email, this.address});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return new User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  final String street;
  final String city;
  final Geo geo;

  Address({this.street, this.geo, this.city});

  factory Address.fromJson(Map<dynamic, dynamic> json) {
    return new Address(
      street: json['street'],
      city: json['city'],
      geo: Geo.fromJson(
        json['geo'],
      ),
    );
  }
}

class Geo {
  final double lat;
  final double lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<Double, dynamic> json) {
    return new Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
