import 'package:flutter/material.dart';

class GradientBackgroundWidget extends StatelessWidget {
  final Widget? child;
  final List<Color> colors;
  final List<double>? stops;
  final double borderRadius;
  final Alignment? begin;
  final Alignment? end;

  const GradientBackgroundWidget({
    Key? key,
    this.child,
    required this.colors,
    this.begin,
    this.end,
    this.borderRadius = 10,
    this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(

          begin: begin ?? Alignment(0.0, -1.0),
          end: end ?? Alignment(0.0, 1.0),
          colors: colors,
          stops: stops
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: this.child,
    );
  }
}
