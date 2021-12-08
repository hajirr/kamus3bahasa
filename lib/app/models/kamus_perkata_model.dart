import 'dart:convert';

KamusPerkata kamusPerkataFromJson(String str) =>
    KamusPerkata.fromJson(json.decode(str));

String kamusPerkataToJson(KamusPerkata data) => json.encode(data.toJson());

class KamusPerkata {
  KamusPerkata({
    required this.data,
  });

  List<Datum> data;

  factory KamusPerkata.fromJson(Map<String, dynamic> json) => KamusPerkata(
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
    required this.abjad,
  });

  String bahasa;
  String bebasan;
  String english;
  String abjad;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bahasa: json["bahasa"],
        bebasan: json["bebasan"],
        english: json["english"],
        abjad: json["abjad"],
      );

  Map<String, dynamic> toJson() => {
        "bahasa": bahasa,
        "bebasan": bebasan,
        "english": english,
        "abjad": abjad,
      };
}
