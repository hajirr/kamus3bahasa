import 'dart:convert';

ContohKalimatModel contohKalimatModelFromJson(String str) =>
    ContohKalimatModel.fromJson(json.decode(str));

String contohKalimatModelToJson(ContohKalimatModel data) =>
    json.encode(data.toJson());

class ContohKalimatModel {
  ContohKalimatModel({
    required this.data,
  });

  List<Datum> data;

  factory ContohKalimatModel.fromJson(Map<String, dynamic> json) =>
      ContohKalimatModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.bahasa,
    required this.bebasan,
    required this.english,
  });

  String bahasa;
  String bebasan;
  String english;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bahasa: json["bahasa"],
        bebasan: json["bebasan"],
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "bahasa": bahasa,
        "bebasan": bebasan,
        "english": english,
      };
}
