import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/models/kamus.dart';

class MyController extends GetxController {
  TextEditingController cSearch = TextEditingController();

  List quotes = [
    'To learn a language is to have one more window from which to look at the word.',
    'With languages, you are at home anywhere.',
    'Language is power, life and the instrument of culture, the instrument of domination and liberation.',
    'The art of communication is the language of leadership',
    'Language is the road map of a culture. It tells you where its people come from and where they are going.'
  ];

  List<Kamus> results = [];

  Future<List<Kamus>> readJsonData(String? query) async {
    final jsondata = await rootBundle.loadString('assets/json/kamus.json');
    final list = json.decode(jsondata) as List<dynamic>;

    results = list.map((e) => Kamus.fromJson(e)).toList();
    if (query != null) {
      results = results
          .where((element) =>
              element.bahasa!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      print("Error");
    }
    return results;
  }
}
