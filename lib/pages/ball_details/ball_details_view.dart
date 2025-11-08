import 'package:ball_game/pages/ball_details/scoring_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'ball_details_logic.dart';

class BallDetailsPage extends GetView<BallDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoring'),
        actions: [
          Visibility(
              visible: controller.isEdit,
              child: const Text(
                'Save',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).marginOnly(right: 20).gestures(onTap: () {
                controller.saveData();
              }))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: <Widget>[
          Image.asset('assets/icon${controller.ballEntity.type}.png'),
          const SizedBox(
            height: 15,
          ),
          Expanded(child: GetBuilder<BallDetailsLogic>(builder: (_) {
            return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.ballEntity.teams.length,
                itemBuilder: (_, index) {
                  var entity = controller.ballEntity.teams[index];
                  return ScoringItem(
                    entity,
                    isEdit: controller.isEdit,
                  );
                });
          }))
        ].toColumn().marginAll(15)),
      ),
    );
  }
}
