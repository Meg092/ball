import 'dart:convert';

import 'package:intl/intl.dart';

class BallEntity {
  int id;
  DateTime createdTime;
  int type;
  List<TeamEntity> teams;

  BallEntity(
      {required this.id,
      required this.createdTime,
      required this.type,
      required this.teams});

  factory BallEntity.fromJson(Map<String, dynamic> json) {
    return BallEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      teams: (jsonDecode(json['teams']) as List)
          .map((e) => TeamEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'teams': jsonEncode(teams.map((e) => e.toJson()).toList()),
    };
  }

  String get createdTimeStr => DateFormat('MM/dd/yyyy HH:mm').format(createdTime);
}

class TeamEntity {
  String name;
  int colorType;
  int points;

  TeamEntity(
      {required this.name, required this.colorType, required this.points});

  factory TeamEntity.fromJson(Map<String, dynamic> json) {
    return TeamEntity(
      name: json['name'],
      colorType: json['colorType'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'colorType': colorType,
      'points': points,
    };
  }
}
