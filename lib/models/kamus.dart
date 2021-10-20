class Kamus {
  String? bahasa;
  String? bebasan;
  String? english;
  bool? imbuhan;

  Kamus({this.bahasa, this.bebasan, this.english, this.imbuhan});

  Kamus.fromJson(Map<String, dynamic> json) {
    bahasa = json['bahasa'];
    bebasan = json['bebasan'];
    english = json['english'];
    imbuhan = json['imbuhan'];
  }
}
