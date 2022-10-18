
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:info/utils/colors.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AppUtils {
  late ProgressDialog pd;
  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

  void showSuccessToastMsg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg,
      textColor: AppColors.whiteColor,
      backgroundColor: Theme.of(context).primaryColor,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }

  void showErrorToastMsg(String msg) {
    Fluttertoast.showToast(msg: msg,
      textColor: AppColors.whiteColor,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }

  void showProgressDialog(BuildContext context) {
    pd = ProgressDialog(context: context);
    pd.show(
        max: 100,
        msg: 'Please Wait...',
        progressType: ProgressType.valuable,
        backgroundColor: const Color(0xff212121),
        progressValueColor: const Color(0xff3550B4),
        progressBgColor: Colors.white70,
        msgColor: Colors.white,
        valueColor: Colors.white);
  }

  void hideDialog(BuildContext context) {
   Navigator.of(context).pop(true);
  }
}