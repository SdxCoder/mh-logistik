import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mh_logistik/core/router/router.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';
import 'package:mh_logistik/core/utils/dimens.dart';
import 'package:mh_logistik/core/utils/translations/translate_text_of.dart';

import '../button.dart';
import 'appDialog.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? btnText;
  const InfoDialog({Key? key,  required this.title ,required this.description, this.btnText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w700, color: AppTheme.textBlackColor),
        ),
        SizedBox(height: Dimens.paddingLarge),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: Dimens.paddingSection,
        ),
        RaisedButtonCustom(
          btnText: btnText ?? TranslateTextOf.lblBtnOk.tr,
          onPressed: () {
            appRouter.pop();
          },
        )
      ],
    );
  }
}
