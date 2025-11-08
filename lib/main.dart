import 'package:ball_game/db_ball/db_ball.dart';
import 'package:ball_game/pages/add_ball/add_ball_binding.dart';
import 'package:ball_game/pages/add_ball/add_ball_mang.dart';
import 'package:ball_game/pages/add_ball/add_ball_view.dart';
import 'package:ball_game/pages/ball_charge/ball_charge_binding.dart';
import 'package:ball_game/pages/ball_charge/ball_charge_view.dart';
import 'package:ball_game/pages/ball_details/ball_details_binding.dart';
import 'package:ball_game/pages/ball_details/ball_details_view.dart';
import 'package:ball_game/pages/ball_main/ball_main_binding.dart';
import 'package:ball_game/pages/ball_main/ball_main_view.dart';
import 'package:ball_game/pages/records/records_binding.dart';
import 'package:ball_game/pages/records/records_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = Colors.black;
Color bgColor = const Color(0xfff7f7f7);

List<Color> colorList = const [
  Color(0xffff3100),
  Color(0xff797979),
  Color(0xffff00ce),
  Color(0xff8900ff),
  Color(0xffff8900),
  Color(0xff0076ff),
  Color(0xff03cb48),
];

List<String> ballTypes = [
  'Basketball scoring',
  'Badminton scoring',
  'Football scoring',
  'Table tennis scoring',
  'Volleyball scoring'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBall().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Games,
      initialRoute: '/',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          colorScheme: ColorScheme.light(
            primary: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          )),
    );
  }
}
List<GetPage<dynamic>> Games = [
  GetPage(name: '/', page: () => BallChargeView(), binding: BallChargeBinding()),
  GetPage(name: '/ballMain', page: () => BallMainPage(), binding: BallMainBinding()),
  GetPage(name: '/ballDetail', page: () => BallDetailsPage(), binding: BallDetailsBinding()),
  GetPage(name: '/addBall', page: () => AddBallPage(), binding: AddBallBinding()),
  GetPage(name: '/addBallSec', page: () => AddBallMang()),
  GetPage(name: '/records', page: () => RecordsPage(), binding: RecordsBinding()),
];