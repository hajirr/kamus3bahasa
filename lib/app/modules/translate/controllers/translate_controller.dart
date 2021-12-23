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

  void searchData() {
    isSearching = true;
    results.clear();
    for (var i = 0; i < word.length; i++) {
      if (word[i].bahasa.contains(searchWord) ||
          word[i].bebasan.contains(searchWord) ||
          word[i].english.contains(searchWord)) {
        results.add(Datum(
            bahasa: word[i].bahasa,
            bebasan: word[i].bebasan,
            english: word[i].english,
            abjad: word[i].abjad));
      }
    }
    update();
  }

  void initData() {
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

  bool isFavorite(index) {
    return homeController.box.read(results[index].bahasa) ?? false;
  }

  void valueChanged(index, value) {
    homeController.box.write(results[index].bahasa, value);
    print(
        "${results[index].bahasa} INDEX Ke-$index ${homeController.box.read(results[index].bahasa)}");
  }

  Widget searchCondition(mode) {
    if (mode == LoadStatus.idle) {
      return const Center(child: Text("Pull up load"));
    } else if (mode == LoadStatus.loading) {
      return const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (mode == LoadStatus.failed) {
      return const Center(child: Text("Load Failed! Click retry!"));
    } else if (mode == LoadStatus.canLoading) {
      return const Center(child: Text("Release to load more"));
    } else {
      return const Center(child: Text("No more Data"));
    }
  }
}
