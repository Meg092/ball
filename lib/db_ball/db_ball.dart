import 'dart:convert';

import 'package:ball_game/db_ball/ball_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBBall extends GetxService {
  late Database dbBase;

  Future<DBBall> init() async {
    await createBallDB();
    return this;
  }

  createBallDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'ball.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createBallTable(db);
    });
  }

  createBallTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS ball (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, teams TEXT)');
  }

  insertBall(BallEntity entity) async {
    final id = await dbBase.insert('ball', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'teams': jsonEncode(entity.teams.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  cleanBallData() async {
    await dbBase.delete('ball');
  }

  Future<List<BallEntity>> getBallAllData() async {
    var result = await dbBase.query('ball', orderBy: 'createdTime DESC');
    return result.map((e) => BallEntity.fromJson(e)).toList();
  }
}
