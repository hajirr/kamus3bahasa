import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  List? items;
  Future loadKamus() async {
    final response = await rootBundle.load("assets/kamus.json");
    final data = await json.decode(response.toString());
    items = data["items"];
    update();
  }
}
