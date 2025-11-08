import 'package:ball_game/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'records_logic.dart';

class RecordsPage extends GetView<RecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historical records'),
        actions: [
          const Text(
            'Clean',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.cleanBallData();
          })
        ],
      ),
      body: SafeArea(child: Obx(() {
        return controller.list.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.length,
                itemBuilder: (_, index) {
                  final entity = controller.list[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      Image.asset('assets/icon${entity.type}.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: <Widget>[
                        Text(
                          ballTypes[entity.type],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          entity.createdTimeStr,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ].toColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/icon7.png')
                    ].toRow(),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)).marginOnly(bottom: 10)
                      .gestures(onTap: () {
                    Get.toNamed('/ballDetail',
                        arguments: entity, parameters: {'isEdit': 'false'});
                  });
                });
      })),
    );
  }
}
