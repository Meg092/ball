import 'package:ball_game/db_ball/ball_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddBallLogic extends GetxController {
  int type = Get.arguments;

  List<TeamEntity> teamList = [];

  void addTeam() {
    teamList.add(TeamEntity(name: '', colorType: 0, points: 0));
    update();
  }

  void create() {
    if (teamList.length < 2) {
      Fluttertoast.showToast(msg: 'Please add at least two teams');
      return;
    }
    for (var i = 0; i < teamList.length; i++) {
      final entity = teamList[i];
      if (entity.name.isEmpty) {
        Fluttertoast.showToast(msg: 'Please add team name');
        return;
      }
      print(
          'name:${entity.name}-colorType:${entity.colorType}- points:${entity.points}');
    }
    Get.toNamed('/ballDetail',
        arguments: BallEntity(
            id: 0, createdTime: DateTime.now(), type: type, teams: teamList));
  }
}
