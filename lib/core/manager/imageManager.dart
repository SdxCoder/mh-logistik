import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/manager/permissionsManager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/result.dart';
import '../router/router.dart';
import '../utils/appTheme.dart';
import '../utils/logger.dart';

@singleton
class ImageManager {
  final ImagePicker imagePicker = ImagePicker();
  static final BuildContext? context =
      appRouter.navigatorKey.currentState?.overlay?.context;

  ///
  /// Take picture from device gallery
  ///
  Future<Result<CroppedFile>> openGallery() async {
    // final result = await PermissonsManager.handlePermisson(Permission.storage);

    // if (result) {
    // Check if the device is mobile
    //
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final pickedFile = await imagePicker.pickImage(
            source: ImageSource.camera,
            imageQuality: 80,
            maxHeight: 2000,
            maxWidth: 2000);

        if (pickedFile != null) {
          final file = await _cropImage(pickedFile.path);
          return Result.success(file);
        } else {
          return const Result.error("");
        }
      } else {
        //
        return const Result.error("Platform Error");
      }
    } on PlatformException catch (e) {
      logger.d("Image picker error = ${e.code}");

      return const Result.error("");
    }
    // } else {
    //   return const Result.error("");
    // }
  }

  Future<CroppedFile?> _cropImage(String path) async {
    //
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 80,
      uiSettings: buildUiSettings(),
    );

    return croppedFile;
  }

  List<PlatformUiSettings>? buildUiSettings() {
    return [
      AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarWidgetColor: AppTheme.primaryColor,
          backgroundColor: Colors.white,
          activeControlsWidgetColor: AppTheme.primaryColor,
          statusBarColor: Colors.grey,

          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
    ];
  }
}
