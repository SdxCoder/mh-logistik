import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mh_logistik/core/router/router.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';
import 'package:mh_logistik/core/utils/dimens.dart';
import 'package:mh_logistik/core/utils/translations/translate_text_of.dart';

import '../button.dart';
import 'appDialog.dart';

class ActionDialog extends StatelessWidget {
  final List<Widget> children;
  final String? okButtonText;
  final String? cancelButtonText;

  const ActionDialog(
      {Key? key,
      required this.children,
      this.okButtonText,
      this.cancelButtonText})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        ...children,
        Row(
          children: [
            Expanded(
              child: RaisedButtonCustom(
                btnColor: AppTheme.textGrayColor,
                btnText: cancelButtonText ?? TranslateTextOf.lblBtnNo.tr,
                onPressed: () {
                  appRouter.pop(false);
                },
              ),
            ),
            SizedBox(width: Dimens.paddingLarge),
            Expanded(
              child: RaisedButtonCustom(
                btnText: okButtonText ?? TranslateTextOf.lblBtnYes.tr,
                onPressed: () {
                  appRouter.pop(true);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
