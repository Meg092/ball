import 'package:ball_game/db_ball/ball_entity.dart';
import 'package:ball_game/db_ball/db_ball.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordsLogic extends GetxController {

  DBBall dbBall = Get.find();

  var list = <BallEntity>[].obs;

  getData() async {
    list.value = await dbBall.getBallAllData();
  }

  cleanBallData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbBall.cleanBallData();
            await getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
