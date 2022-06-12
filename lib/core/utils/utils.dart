import 'package:flutter/material.dart';
import 'package:mh_logistik/core/router/router.dart';

class Utils {
  static final BuildContext? context =
      appRouter.navigatorKey.currentState?.overlay?.context;
  
  static Future<T?> bottomSheet<T>(Widget child, {bool isDismissible = true, bool useSafeArea = true}) async {
    return await showModalBottomSheet<T>(
      context: context!,
      isScrollControlled: true,   
      isDismissible:isDismissible ,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (c) {
        return child;
      },
    );
  }

  static Future<T?> dialog<T>(Widget child,
      {bool barrierDismissible = true, bool useSafeArea = true}) async {
    return await showDialog<T>(
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      context: context!,
      builder: (context) {
        return child;
      },
    );
  }
}
