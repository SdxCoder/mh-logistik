// import 'package:flutter/material.dart';
// import 'package:mh_logistik/core/utils/appTheme.dart';
// import 'package:mh_logistik/core/utils/dimens.dart';

// import 'button.dart';
// import 'package:get/utils.dart';

// class SettingsUnitPicker extends StatelessWidget {
//   // Shows a pre selected
//   final bool isDefault;
//   final VoidCallback onPressedDefault;
//   final VoidCallback onPressedOther;
//   final String defaultText;
//   final String otherText;

//   const SettingsUnitPicker(
//       {Key? key,
//       required this.isDefault,
//       required this.onPressedDefault,
//       required this.onPressedOther,
//       required this.defaultText,
//       required this.otherText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         //
//         Spacer(),
//         RaisedButtonCustom(
//             width: Dimens.width20,
//             height: 40,
//             padding: EdgeInsets.zero,
//             fontSize: 14,
//             btnColor: isDefault ? AppTheme.greenColor : AppTheme.greyColor,
//             btnTextColor: isDefault ? Colors.white : AppTheme.textColor,
//             onPressed: () {
//               onPressedDefault();
//             },
//             btnText: defaultText.capitalizeFirst!),
//         Spacer(),
//         RaisedButtonCustom(
//             width: Dimens.width20,
//             height: 40,
//             fontSize: 14,
//             padding: EdgeInsets.zero,
//             btnColor: isDefault ? AppTheme.greyColor : AppTheme.greenColor,
//             btnTextColor: isDefault ? AppTheme.textColor : Colors.white,
//             onPressed: () {
//               onPressedOther();
//             },
//             btnText: otherText.capitalizeFirst!),
//         Spacer(),
//       ],
//     );
//   }
// }
