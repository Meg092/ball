import 'package:ball_game/pages/add_ball/add_ball_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'add_ball_logic.dart';

class AddBallPage extends GetView<AddBallLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forming a team'),
        actions: [
          const Text(
            'Create',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.create();
          })
        ],
      ),
      body: GetBuilder<AddBallLogic>(builder: (_) {
        return SafeArea(
            child: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: controller.teamList.isEmpty
                          ? const Center(
                        child: Text('No team'),
                      )
                          : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.teamList.length,
                          itemBuilder: (_, index) {
                            var teamEntity = controller.teamList[index];
                            return AddBallItem(
                              teamEntity,
                              deleteTap: () {
                                controller.teamList.removeAt(index);
                                controller.update();
                              },
                            );
                          })),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: <Widget>[Image.asset('assets/icon10.png')]
                        .toRow(mainAxisAlignment: MainAxisAlignment.center),
                  )
                      .decorated(
                      color: const Color(0xfff8f8f8),
                      borderRadius: BorderRadius.circular(10))
                      .gestures(onTap: () {
                        controller.addTeam();
                  })
                ].toColumn(),
              )
                  .decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              )
                  .marginOnly(top: 50, left: 15, right: 15),
              Image.asset('assets/icon${controller.type}.png').marginOnly(
                  top: 25)
            ].toStack(alignment: Alignment.topCenter));
      }),
    );
  }
}
