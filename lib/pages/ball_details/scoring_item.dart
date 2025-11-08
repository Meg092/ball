import 'package:ball_game/db_ball/ball_entity.dart';
import 'package:ball_game/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class ScoringItem extends StatefulWidget {
  ScoringItem(this.teamEntity, {this.isEdit = false, super.key});

  TeamEntity teamEntity;
  final bool isEdit;

  @override
  State<ScoringItem> createState() => _ScoringItemState();
}

class _ScoringItemState extends State<ScoringItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        Text(
          widget.teamEntity.name,
          style: const TextStyle(color: Colors.white),
        ),
        <Widget>[
          Visibility(
              visible: widget.isEdit, child: Image.asset('assets/icon5.png').gestures(onTap: (){
                setState(() {
                  if(widget.teamEntity.points <= 0){
                    return;
                  }
                  widget.teamEntity.points --;
                });
          })),
          Text(
            widget.teamEntity.points.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 65),
          ),
          Visibility(
              visible: widget.isEdit, child: Image.asset('assets/icon6.png').gestures(onTap: (){
            setState(() {
              widget.teamEntity.points ++;
            });
          })),
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ).decorated(
        color: colorList[widget.teamEntity.colorType],
        borderRadius: BorderRadius.circular(6)).marginOnly(bottom: 10);
  }
}
