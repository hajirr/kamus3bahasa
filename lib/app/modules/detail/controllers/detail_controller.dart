import 'package:get/get.dart';
import 'package:kamus3bahasa/app/modules/home/controllers/home_controller.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String bahasa = Get.arguments[0];
  String bebasan = Get.arguments[1];
  String english = Get.arguments[2];
  String abjad = Get.arguments[3];
  HomeController homeController = Get.find();

  addBookmark(word) {
    if (homeController.box.read(word) == true) {
      homeController.box.write(word, false);
    } else {
      homeController.box.write(word, true);
    }
    update();
  }
}
