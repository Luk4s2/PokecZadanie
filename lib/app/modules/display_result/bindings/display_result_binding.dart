import 'package:get/get.dart';

import '../controllers/display_result_controller.dart';

class DisplayResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisplayResultController>(
      () => DisplayResultController(),
    );
  }
}
