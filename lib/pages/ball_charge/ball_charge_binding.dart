import 'package:get/get.dart';

import 'ball_charge_logic.dart';

class BallChargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BallChargeLogic(),
      permanent: true,
    );
  }
}
