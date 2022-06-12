import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mh_logistik/core/utils/appTheme.dart';
import 'package:mh_logistik/core/shared_widgets/styled_text.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  final Widget? bottom;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  const AppBarCustom({
    Key? key,
    this.title,
    this.actions = const [],
    this.leading,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.bottom,
    this.leadingWidth,
    this.systemUiOverlayStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppTheme.backgroundColor,
      centerTitle: centerTitle,
      elevation: 0,
      
      leadingWidth: leadingWidth,
      title: title == null
          ? const AppbarTitle()
          : Text(title!,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: AppTheme.textBlackColor, fontWeight: FontWeight.w500)),
      toolbarHeight: kToolbarHeight,
      leading: leading,
      systemOverlayStyle: systemUiOverlayStyle,
      iconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppTheme.textBlackColor),
      actionsIconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppTheme.textBlackColor),
      automaticallyImplyLeading: automaticallyImplyLeading,
      bottom: bottom != null
          ? PreferredSize( preferredSize: preferredSize, child: bottom!,)
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//
class AppbarTitle extends StatelessWidget {
  const AppbarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledText(textAlign: TextAlign.center, inlineSpans: [
      TextSpan(
          text: "Mobile ",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: AppTheme.textBlackColor)),
      TextSpan(
          text: "House",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: AppTheme.primaryColor)),
    ]);
  }
}
