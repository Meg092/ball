import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ball_charge_logic.dart';

class BallChargeView extends GetView<BallChargeLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.ibrj.value
              ? const CircularProgressIndicator(color: Colors.orangeAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.mixolt();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
