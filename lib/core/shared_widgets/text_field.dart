import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String Function(String?)? validator;
  final Function(String)? onFieldSubmit;
  final Function? onChanged;

  final String? hintText;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final String? errorText;

  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? enforceMaxLength;

  static const Color _textFieldThemeColor = const Color(0xff000000);

  const TextFieldCustom({
    Key? key,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.hintText,
    this.backgroundColor = Colors.white,
    this.textColor = _textFieldThemeColor,
    this.borderRadius = 10,
    this.onChanged,
    this.errorText,
    this.initialValue,
    this.maxLines = 1,
    this.maxLength,
    this.enforceMaxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      onChanged: onChanged as void Function(String)?,
      validator: validator,
      cursorWidth: 1,
      maxLines: maxLines,
    //  cursorColor: AppTheme.borderColor,
      autofocus: false,
      maxLength: maxLength,
      maxLengthEnforcement: enforceMaxLength,
      textCapitalization: TextCapitalization.sentences,
      
       keyboardType: TextInputType.text,
      controller: controller,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(decoration: TextDecoration.none, color: textColor),
      onFieldSubmitted: onFieldSubmit,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        errorMaxLines: 3,
        errorText: errorText,
   
        labelText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w300, color: AppTheme.borderColor),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: maxLines > 1 ? 8 : 2),
         border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(width: 0.3)),
      ),
    );
  }
}
