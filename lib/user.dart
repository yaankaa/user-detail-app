import 'address.dart'; //import chai tyo geo ko file access garna

class User{
  final String id;
  final String name;
  final String email;
  final String address;
  final String number;
  final String website; //geo class pahilaie banayera datatype Geo bhako

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.number,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json[
          'id'], //inverted comma bhitra bhako chai uta api ko website sanga match hunu parcha
      name: json['name'],
      email: json['email'],
      address: json['address'],
      number: json['number'],
       website: json['website'],
    );
  }
}