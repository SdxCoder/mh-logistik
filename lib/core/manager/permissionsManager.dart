import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:mh_logistik/core/shared_widgets/dialogs/actionDialog.dart';
import 'package:permission_handler/permission_handler.dart';

import '../shared_widgets/dialogs/permissionDeniedDialog.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

///
/// Manager to handle app permissions.
///
class PermissonsManager {
  /// Request application permissions
  static Future requestPermissions() async {
    final Map<Permission, PermissionStatus> statuses =
        await [Permission.storage, Permission.photos].request();

    logger.d("Permissions = $statuses");
  }

  /// Handle Permission
  static Future<bool> handlePermisson(Permission permission) async {
    final status = await permission.request();

    logger.d("$permission Status = $status");

    ///
    if (status == PermissionStatus.granted) {
      return true;
    }

    ///
    else {
      switch (status) {
        case PermissionStatus.denied:
          final result = await Utils.dialog(StoragePermissionDeniedDialog(
            permission: permission
                .toString()
                .replaceAll('Permission.', '')
                .tr
                .capitalize!,
          ));

          if (result != null && result) {
            await openAppSettings();
          }
          break;
        case PermissionStatus.limited:
          break;
        case PermissionStatus.restricted:
          break;
        case PermissionStatus.permanentlyDenied:
          final result = await Utils.dialog(const ActionDialog(
            children: [],
          ));

          if (result != null && result) {
            await openAppSettings();
          }

          break;
        default:
      }

      return false;
    }
  }
}
