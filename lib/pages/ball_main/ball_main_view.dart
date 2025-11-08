import 'package:ball_game/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'ball_main_logic.dart';

class BallMainPage extends GetView<BallMainLogic> {
  Widget _item(int index) {
    return Container(
      width: double.infinity,
      height: 86,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: <Widget>[
        Image.asset(
          'assets/icon$index.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          ballTypes[index],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        const SizedBox(
          width: 10,
        ),
        Image.asset('assets/icon7.png')
      ].toRow(),
    )
        .decorated(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 3),
              spreadRadius: 1)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
          Get.toNamed('/addBall', arguments: index);
        });
  }

  Widget _bottomItem(int index) {
    final titles = ['Historical records', 'App version'];
    return Container(
      width: double.infinity,
      height: 40,
      color: Colors.transparent,
      child: <Widget>[
        Text(titles[index]),
        index == 0
            ? const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Colors.grey,
              )
            : Obx(() {
                return Text(
                  controller.appVersion.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                );
              })
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      if (index == 0) {
        Get.toNamed('/records');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        Image.asset(
          'assets/bg.png',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Scoreboard for the ball game',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Support multiple types of competitions'),
              const SizedBox(
                height: 40,
              ),
              _item(0),
              _item(1),
              _item(2),
              _item(3),
              _item(4),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: <Widget>[_bottomItem(0), _bottomItem(1)].toColumn(
                    separator: Divider(
                  height: 15,
                  color: Colors.grey[300],
                )),
              ).decorated(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                    spreadRadius: 1)
              ], color: Colors.white, borderRadius: BorderRadius.circular(10))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          ).marginAll(15)),
        )
      ].toStack(),
    );
  }
}
