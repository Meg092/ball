import 'package:ball_game/main.dart';
import 'package:ball_game/pages/add_ball/ball_text_field.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';
import '../../db_ball/ball_entity.dart';

class AddBallItem extends StatefulWidget {
  AddBallItem(this.teamEntity, {this.deleteTap,super.key});

  TeamEntity teamEntity;
  final VoidCallback? deleteTap;

  @override
  State<AddBallItem> createState() => _AddBallItemState();
}

class _AddBallItemState extends State<AddBallItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: <Widget>[
        <Widget>[
          const Text(
            'Team name',
            style: TextStyle(color: Color(0xff5f5f5f)),
          ),
          Image.asset('assets/icon9.png').gestures(onTap: () {
            widget.deleteTap?.call();
          })
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        SizedBox(
          height: 40,
          child: BallTextField(
              padding: EdgeInsets.zero,
              value: widget.teamEntity.name,
              maxLength: 30,
              onChange: (v) {
                widget.teamEntity.name = v;
              }),
        ),
        const Text(
          'Team color',
          style: TextStyle(color: Color(0xff5f5f5f)),
        ),
        const SizedBox(height: 6,),
        SizedBox(
          height: 32,
          child: GridView.builder(
            shrinkWrap:  true,
            scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 10),
              itemCount: colorList.length,
              itemBuilder: (_, index) {
                return Container(
                  child: <Widget>[
                    Visibility(
                        visible: widget.teamEntity.colorType == index,
                        child:const Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.white,
                        ))
                  ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                ).decorated(
                    color: colorList[index],
                    borderRadius: BorderRadius.circular(6)).gestures(onTap: (){
                      setState(() {
                        widget.teamEntity.colorType = index;
                      });
                });
              }),
        )
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    )
        .decorated(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffe3e3e3)))
        .marginOnly(bottom: 10);
  }
}
