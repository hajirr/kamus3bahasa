class Kamus {
  String? bahasa;
  String? bebasan;
  String? english;

  Kamus({
    this.bahasa,
    this.bebasan,
    this.english,
  });

  Kamus.fromJson(Map<String, dynamic> json) {
    bahasa = json['bahasa'];
    bebasan = json['bebasan'];
    english = json['english'];
  }
}
