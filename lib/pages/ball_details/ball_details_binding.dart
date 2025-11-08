import 'package:get/get.dart';

import 'ball_details_logic.dart';

class BallDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BallDetailsLogic());
  }
}