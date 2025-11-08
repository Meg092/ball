import 'package:ball_game/db_ball/ball_entity.dart';
import 'package:ball_game/db_ball/db_ball.dart';
import 'package:ball_game/pages/ball_main/ball_main_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BallDetailsLogic extends GetxController {
  DBBall dbBall = Get.find();

  BallEntity ballEntity = Get.arguments;
  bool isEdit = true;

  void saveData() async {
    await dbBall.insertBall(ballEntity);
    Fluttertoast.showToast(msg: "Save successful");
    Get.offUntil(
      GetPageRoute(page: () => BallMainPage()),
      (route) => route.settings.name == '/ballMain',
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.parameters.values.isNotEmpty) {
      isEdit = Get.parameters['isEdit'] == 'true' ;
    }
    update();
    super.onInit();
  }
}
