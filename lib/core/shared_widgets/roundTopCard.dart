import 'package:flutter/material.dart';
import 'package:mh_logistik/core/utils/dimens.dart';

class RoundedTopCard extends StatelessWidget {
  final Widget child;
  final double? height;
  const RoundedTopCard({Key? key, required this.child, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? Dimens.height70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: child,
    );
  }
}
