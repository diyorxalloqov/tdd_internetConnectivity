// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
@immutable
class UserModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? username;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final Address? address;
  @HiveField(5)
  final String? phone;
  @HiveField(6)
  final String? website;
  @HiveField(7)
  final Company? company;
  const UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    if (id.runtimeType != int) {
      throw FormatException(
          "Type of 'id' is int, but you enter as string, YOUR INPUT IS: $id");
    } else if (!email!.contains("@")) {
      throw "EMAIL IS NOT VALID. BECAUSE IT DOES NOT CONAINT '@' OR EMAIL IS NULL. YOUR EMAIL IS: $email";
    }
    // "9984441212";
    else if (phone == null || phone!.length != 12) {
      throw "YOUR PHONE NUMBER IS NULL OR NOT VALID, PLEASE ENTER PHONE NUMBER AS: ### ## ### ## ##, YOUR ENTERED NUMBER IS: $phone";
    } else {
      return <String, dynamic>{
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toMap(),
        'phone': phone,
        'website': website,
        'company': company?.toMap(),
      };
    }
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      company: map['company'] != null
          ? Company.fromMap(map['company'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.website == website &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        company.hashCode;
  }
}

@HiveType(typeId: 1)
@immutable
class Address {
  @HiveField(0)
  final String? street;
  @HiveField(1)
  final String? suite;
  @HiveField(2)
  final String? city;
  @HiveField(3)
  final String? zipcode;
  @HiveField(4)
  final Geo? geo;
  const Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] != null ? map['street'] as String : null,
      suite: map['suite'] != null ? map['suite'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      geo: map['geo'] != null
          ? Geo.fromMap(map['geo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.suite == suite &&
        other.city == city &&
        other.zipcode == zipcode &&
        other.geo == geo;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        suite.hashCode ^
        city.hashCode ^
        zipcode.hashCode ^
        geo.hashCode;
  }
}

@HiveType(typeId: 2)
@immutable
class Geo {
  @HiveField(0)
  final String? lat;
  @HiveField(1)
  final String? lng;
  const Geo({
    this.lat,
    this.lng,
  });

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] != null ? map['lat'] as String : null,
      lng: map['lng'] != null ? map['lng'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) =>
      Geo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Geo other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

@HiveType(typeId: 3)
@immutable
class Company {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? catchPhrase;
  @HiveField(2)
  final String? bs;
  const Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] != null ? map['name'] as String : null,
      catchPhrase:
          map['catchPhrase'] != null ? map['catchPhrase'] as String : null,
      bs: map['bs'] != null ? map['bs'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.catchPhrase == catchPhrase &&
        other.bs == bs;
  }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}
