import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';
import 'package:mh_logistik/core/utils/dimens.dart';
import 'package:mh_logistik/core/utils/translations/translate_text_of.dart';

class RaisedButtonCustom extends StatelessWidget {
  final Widget? child;
  final String btnText;
  final VoidCallback? onPressed;
  final Color? btnColor;
  final Color? btnTextColor;
  final double? width;
  final double? height;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final double borderRadius;
  final BorderRadius? borderRadiusShape;
  final bool? isLoading;
  final VoidCallback? onUpdate;
  final bool isUpdate;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double elevation;

  const RaisedButtonCustom(
      {this.child,
      this.btnText = '',
      this.onPressed,
      this.btnColor,
      this.btnTextColor = Colors.white,
      this.width,
      this.height = 46,
      this.disabledColor,
      this.disabledTextColor,
      this.borderRadius = 50.0,
      this.isLoading = false,
      this.onUpdate,
      this.isUpdate = false,
      this.padding,
      this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.elevation = 0.0,
      this.borderRadiusShape});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Dimens.width50,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation:
              MaterialStateProperty.resolveWith<double>((states) => elevation),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => btnTextColor!),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledColor ?? AppTheme.borderColor;
            }
            return btnColor ?? Theme.of(context).primaryColor;
          }),
          padding:
              MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
            return padding ?? const EdgeInsets.symmetric(horizontal: 16);
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (states) {
              return RoundedRectangleBorder(
                  borderRadius:
                      borderRadiusShape ?? BorderRadius.circular(borderRadius));
            },
          ),
       ),
        onPressed: isUpdate ? onUpdate : onPressed,
        child: isLoading == true
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : child ??
                FittedBox(
                  child: Text(
                    isUpdate
                        ? TranslateTextOf.lblBtnUpdate.tr.toUpperCase()
                        : btnText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: fontWeight,
                        fontSize: fontSize,
                        color: btnTextColor),
                  ),
                ),
      ),
    );
  }
}
