import 'dart:developer';

import 'package:flutter/foundation.dart';

final logger = Logger.create(isDebug: kDebugMode);

abstract class Logger {
  final bool isDebug;

  factory Logger.create({required bool isDebug}) {
    if (isDebug) {
      return DebuLogger(isDebug);
    } else {
      return RemoteLogger(isDebug);
    }
  }

  Logger._internal(this.isDebug);

  void d(String msg);
  void e(String? msg, Object? err);
}

class DebuLogger extends Logger {
  DebuLogger(isDebug) : super._internal(isDebug);

  void d(String msg) {
    if (isDebug) {
      log(msg);
    }
  }

  void e(String? msg, Object? err) {
    if (isDebug) {
      log(msg ?? '', error: err);
    }
  }
}

/// *@
// class Logger {
//   static const _shouldLog = !kReleaseMode;

//   static void d(String message) {
//     if (_shouldLog) {
//       log(message);
//     }
//   }

//   static void e(String? message, Object? err) {
//     if (_shouldLog) {
//       log(message ?? '', error: err);
//     }
//   }
// }

class RemoteLogger extends Logger {
  RemoteLogger(isDebug) : super._internal(isDebug);

  void d(String msg) {}

  void e(String? msg, Object? err) {}
}
