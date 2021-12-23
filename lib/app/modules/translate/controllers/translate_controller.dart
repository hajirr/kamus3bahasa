import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/app/models/kamus_perkata_model.dart';
import 'package:kamus3bahasa/app/modules/home/controllers/home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TranslateController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getData();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String searchWord = '';
  int currentDataWord = 0;
  bool isLoading = false;
  bool isSearching = false;
  List<Datum> word = [];
  List results = [];

  TextEditingController searchWordController = TextEditingController();
  RefreshController scrollController = RefreshController();
  HomeController homeController = Get.put(HomeController());

  Future getData() async {
    final data = await rootBundle.loadString('assets/json/kamus.json');
    word = kamusPerkataFromJson(data).data;
  }

  void refreshData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      results.clear();
      currentDataWord = 0;
      initData();
      update();
      scrollController.refreshCompleted();
    } catch (e) {
      scrollController.refreshFailed();
    }
    isSearching = false;
  }

  void loadData() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      if (results.length >= word.length) {
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
    isSearching = true;
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
    update();
  }

  void addBookmark(input) {
    homeController.box.read(input) == true
        ? homeController.box.write(input, false)
        : homeController.box.write(input, true);
    update();
    print("$input ${homeController.box.read(input)}");
  }

  void initData() async {
    for (var i = 0; i < 15; i++) {
      if (isSearching) {
        if (word[currentDataWord].bahasa.contains(searchWord) ||
            word[currentDataWord].bebasan.contains(searchWord) ||
            word[currentDataWord].english.contains(searchWord)) {
          results.add(Datum(
              bahasa: word[currentDataWord].bahasa,
              bebasan: word[currentDataWord].bebasan,
              english: word[currentDataWord].english,
              abjad: word[currentDataWord].abjad));
        }
      } else {
        results.add(Datum(
            bahasa: word[currentDataWord].bahasa,
            bebasan: word[currentDataWord].bebasan,
            english: word[currentDataWord].english,
            abjad: word[currentDataWord].abjad));
      }
      currentDataWord++;
    }
    update();
  }
}
