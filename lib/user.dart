import 'dart:developer';

import 'address.dart'; //import chai tyo geo ko file access garna

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String number;
  final String website; //geo class pahilaie banayera datatype Geo bhako

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.number,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return User(
      id: json[
          'id'], //inverted comma bhitra bhako chai uta api ko website sanga match hunu parcha
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      number: json['phone'],
      website: json['website'],
    );
  }
}
