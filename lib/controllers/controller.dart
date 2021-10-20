import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/models/kamus.dart';
// import 'package:kamus3bahasa/models/kamus.dart';

class MyController extends GetxController {
  // Kamus? kamus;

  Future<List<Kamus>> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/json/kamus.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Kamus.fromJson(e)).toList();
  }
}
