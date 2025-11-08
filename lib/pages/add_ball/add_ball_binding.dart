import 'package:get/get.dart';

import 'add_ball_logic.dart';

class AddBallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBallLogic());
  }
}