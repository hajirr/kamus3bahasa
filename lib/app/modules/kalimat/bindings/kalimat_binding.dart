import 'package:get/get.dart';

import '../controllers/kalimat_controller.dart';

class KalimatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KalimatController>(
      () => KalimatController(),
    );
  }
}
