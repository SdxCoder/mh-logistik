import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mh_logistik/core/router/router.dart';

import '../utils/appTheme.dart';
import 'dimens.dart';

/// *@
class SnackMsg {
  static const int _snackDurationSecs = 2;
   static final BuildContext? context =
      appRouter.navigatorKey.currentState?.overlay?.context;

  static void err(String text, {bool pop = false}) {
    if (text.isNotEmpty) {
      Get.snackbar('', text,
          titleText: const Offstage(),
          duration: const Duration(seconds: _snackDurationSecs),
          backgroundColor: AppTheme.textGrayColor,
          padding: const EdgeInsets.all(Dimens.paddingLarge),
          margin: const EdgeInsets.all(Dimens.paddingLarge),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }

    if (pop) {
      Future.delayed(const Duration(seconds: _snackDurationSecs), () {
        appRouter.pop();
      });
    }
  }

  static void success(String text, {bool pop = true}) {
    if (text.isNotEmpty) {
      Get.snackbar('', text,
          titleText: const Offstage(),
          duration: const Duration(seconds: _snackDurationSecs),
          backgroundColor: AppTheme.primaryColor,
          padding: const EdgeInsets.all(Dimens.paddingLarge),
          margin: const EdgeInsets.all(Dimens.paddingLarge),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }

    if (pop) {
      Future.delayed(const Duration(seconds: _snackDurationSecs), () {
        appRouter.pop();
      });
    }
  }


  // static void toast(String text) {
  //   Fluttertoast.showToast(
      
  //       toastLength: Toast.LENGTH_LONG,
  //       msg: text,
  //       fontSize: 14.0,
  //       backgroundColor: Colors.black);
  // }
}
