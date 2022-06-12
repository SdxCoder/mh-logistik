import 'package:flutter/material.dart';

import 'rounded_card.dart';

class DottedBar extends StatelessWidget {
  final int index;
  final int totalDots;
  final Color? selectedColor;
  final Color? unSelectedColor;

  const DottedBar(
      {Key? key,
      required this.index,
      this.totalDots = 3,
      this.selectedColor,
      this.unSelectedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 2,
      children: [
        ...List.generate(totalDots, (i) {
          return RoundedCard(
            elevation: 1,
            content: SizedBox(
              height: 8,
              width: 8,
            ),
          );
        }),
      ],
    );
  }
}
