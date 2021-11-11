import 'package:flutter_country_app/models/currancy.dart';
import 'package:flutter_country_app/models/flags.dart';
import 'package:flutter_country_app/models/name.dart';
import 'package:flutter_country_app/sqflite/database_helper.dart';

class CountryModel {
  Name name;
 // Currancy currancy;
  Flags flags;
  String region;

  CountryModel(
      {required this.name, required this.flags, required this.region});

  factory CountryModel.Json(dynamic json) {
    return CountryModel(
        name: Name.Json(json['name']),
      //  currancy: Currancy.Json(json['currencies']),
        flags: Flags.Json(json['flags']), region: json['region']);
  }
}
