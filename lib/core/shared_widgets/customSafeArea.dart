import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mh_logistik/core/utils/dimens.dart';

class CustomSafeArea extends StatelessWidget {
  final double padding;
  const CustomSafeArea({Key? key, this. padding = Dimens.paddingLarge,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Platform.isIOS ? 0 : padding ,
      ),
    );
  }
}
