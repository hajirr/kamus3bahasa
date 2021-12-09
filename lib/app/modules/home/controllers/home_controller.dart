import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/app/models/kamus_perkata_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    readJsonData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List quotes = [
    'To learn a language is to have one more window from which to look at the word.',
    'With languages, you are at home anywhere.',
    'Language is power, life and the instrument of culture, the instrument of domination and liberation.',
    'The art of communication is the language of leadership',
    'Language is the road map of a culture. It tells you where its people come from and where they are going.'
  ];

  String searchWord = '';

  List<Datum> results = [];
  bool isLoading = false;
  TextEditingController searchWordController = TextEditingController();

  Future readJsonData() async {
    isLoading = true;
    update();
    try {
      final data = await rootBundle.loadString('assets/json/kamus.json');
      results = kamusPerkataFromJson(data).data;
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
      isLoading = false;
      update();
    }
  }
}
