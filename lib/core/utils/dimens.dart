import 'package:get/get.dart';

/// *@
class Dimens {
  ///
  /// Height
  ///
  // Height relative to screen size
  static double get height8 => Get.height * 0.08;
  static double get height10 => Get.height * 0.10;
  static double get height11 => Get.height * 0.11;
  static double get height15 => Get.height * 0.15;
  static double get height17 => Get.height * 0.18;
  static double get height20 => Get.height * 0.2;
  static double get height25 => Get.height * 0.25;
  static double get height28 => Get.height * 0.28;
  static double get height31 => Get.height * 0.31;
  static double get height35 => Get.height * 0.32;
  static double get height40 => Get.height * 0.40;
  static double get height45 => Get.height * 0.45;
  static double get height50 => Get.height * 0.5;
  static double get height60 => Get.height * 0.6;
  static double get height70 => Get.height * 0.7;
  static double get height75 => Get.height * 0.77;
  static double get height80 => Get.height * 0.8;
  static double get height100 => Get.height;
  static double get topPartHeight => Get.height * 0.40;

  static double get resetButtonHeight => topPartHeight - 28;

  ///
  /// Width
  ///
  // Width relative to screen size
  static double get width5 => Get.width * 0.05;
  static double get width10 => Get.width * 0.1;
  static double get width15 => Get.width * 0.15;
  static double get width20 => Get.width * 0.2;
  static double get width25 => Get.width * 0.25;
  static double get width30 => Get.width * 0.3;
  static double get width32 => Get.width * 0.32;
  static double get width40 => Get.width * 0.4;
  static double get width39 => Get.width * 0.38;
  static double get width50 => Get.width * 0.5;
  static double get width70 => Get.width * 0.7;
  static double get width68 => Get.width * 0.65;
  static double get width80 => Get.width * 0.85;
  static double get width90 => Get.width * 0.9;
  static double get width100 => Get.width;

  ///
  /// Icons
  ///
  static const icon = 20.0;
  static const iconSizeNormal = 24.0;
  static const iconSizeLarge = 36.0;
  static const iconSizeBig = 54.0;
  static const iconSizeHeader = 84.0;
  static double iconFlexible = Get.height * 0.8;

  ///
  /// Cards
  ///
  static const cardElevation = 8.0;

  ///
  /// Margins
  ///
  static const paddingSmall = 4.0;
  static const padding = 8.0;
  static const paddingLarge = 16.0;
  static const paddingBig = 24.0;
  static const paddingSection = 32.0;
  static const paddingContainer = 64.0;

  ///
  /// Corners
  ///
  static const cornersSimple = 16.0;
  static const cornersLarge = 32.0;
  static const cornersBig = 64.0;

  static bool get isSmallDevice => Get.height < 684;
  static bool get isMediumDevice => Get.height > 684 && Get.height < 782;
  static bool get isLargeDevice => Get.height > 900 ;
}
