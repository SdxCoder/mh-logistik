import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/appTheme.dart';

class DigitsTextField extends StatelessWidget {
  final TextEditingController texteditingcontroller;
  final Function(double) onChanged;
  DigitsTextField(
      {Key? key, required this.texteditingcontroller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) {
        if (val.isNotEmpty) {
          onChanged(double.parse(val));
        }
      },
      controller: texteditingcontroller,
      cursorWidth: 1,
      cursorColor: AppTheme.textGrayColor,
      autofocus: false,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      readOnly: false,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp("^\$|^(0|([1-9][0-9]{0,2}))(\\.[0-9]{0,1})?\$"))
      ],
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3!.copyWith(
          color: AppTheme.textBlackColor, decoration: TextDecoration.none),
      onFieldSubmitted: (val) {
        if (val.isNotEmpty) {
          onChanged(double.parse(val));
        }
      },
      decoration: InputDecoration.collapsed(hintText: ''),
    );
  }
}
