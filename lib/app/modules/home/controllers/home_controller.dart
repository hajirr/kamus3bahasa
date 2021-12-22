import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kamus3bahasa/app/models/kamus_perkata_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initData();
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
  GetStorage box = GetStorage();

  List<Datum> word = [];
  List results = [];
  bool isLoading = false;
  TextEditingController searchWordController = TextEditingController();
  RefreshController scrollController = RefreshController();

  void refreshData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      results.clear();
      initData();
      update();
      scrollController.refreshCompleted();
    } catch (e) {
      scrollController.refreshFailed();
    }
  }

  void loadData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      if (results.length >= 35) {
        scrollController.loadNoData();
      } else {
        initData();
        update();
        scrollController.loadComplete();
      }
    } catch (e) {
      scrollController.loadFailed();
    }
  }

  void searchData() async {
    isLoading = true;
    final data = await rootBundle.loadString('assets/json/kamus.json');
    word = kamusPerkataFromJson(data).data;
    results.clear();
    for (var i = 0; i < word.length; i++) {
      if (word[i].bahasa.contains(searchWordController.text) ||
          word[i].bebasan.contains(searchWordController.text) ||
          word[i].english.contains(searchWordController.text)) {
        results.add(Datum(
            bahasa: word[i].bahasa,
            bebasan: word[i].bebasan,
            english: word[i].english,
            abjad: word[i].abjad));
      }
    }
    isLoading = false;
    update();
  }

  void initData() async {
    final data = await rootBundle.loadString('assets/json/kamus.json');
    word = kamusPerkataFromJson(data).data;
    for (var i = 0; i < 15; i++) {
      results.add(Datum(
          bahasa: word[i].bahasa,
          bebasan: word[i].bebasan,
          english: word[i].english,
          abjad: word[i].abjad));
    }
    update();
  }
}
