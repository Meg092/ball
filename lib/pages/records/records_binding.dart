import 'package:get/get.dart';

import 'records_logic.dart';

class RecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordsLogic());
  }
}