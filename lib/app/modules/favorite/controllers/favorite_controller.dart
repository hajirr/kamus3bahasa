import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kamus3bahasa/app/models/kamus_perkata_model.dart';
import 'package:kamus3bahasa/app/modules/home/controllers/home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoriteController extends GetxController {
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

  List<Datum> word = [];
  List results = [];
  bool isLoading = false;
  TextEditingController searchWordController = TextEditingController();
  RefreshController scrollController = RefreshController();
  int currentDataWord = 0;
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
    homeController.box.read(input) == false ||
            homeController.box.read(input) == null
        ? homeController.box.write(input, true)
        : homeController.box.write(input, false);
    update();
  }

  void initData() async {
    for (var i = 0; i < 15; i++) {
      currentDataWord++;
      results.add(Datum(
          bahasa: word[currentDataWord].bahasa,
          bebasan: word[currentDataWord].bebasan,
          english: word[currentDataWord].english,
          abjad: word[currentDataWord].abjad));
    }
    update();
  }
}
