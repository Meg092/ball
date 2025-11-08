import 'package:get/get.dart';

import 'ball_main_logic.dart';

class BallMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BallMainLogic());
  }
}