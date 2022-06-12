// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:mh_logistik/core/shared_widgets/custom_painters/arc_painter.dart';
// import 'package:mh_logistik/core/utils/appTheme.dart';
// import 'package:mh_logistik/core/utils/dimens.dart';
// import 'package:mh_logistik/core/utils/logger.dart';

// enum InitialPosition { start, center, end }

// class HorizontalPicker extends StatefulWidget {
//   final int initialValue;
//   final int minValue, maxValue;
//   final int divisions;
//   final Function(double) onChanged;
//   final InitialPosition initialPosition;
//   final Color backgroundColor;
//   final bool showCursor;
//   final Color cursorColor;
//   final Color activeItemTextColor;
//   final Color passiveItemsTextColor;
//   final String suffix;

//   HorizontalPicker({
//     required this.minValue,
//     required this.maxValue,
//     required this.divisions,
//     required this.onChanged,
//     this.initialPosition = InitialPosition.center,
//     this.backgroundColor = Colors.white,
//     this.showCursor = true,
//     this.cursorColor = Colors.red,
//     this.activeItemTextColor = Colors.blue,
//     this.passiveItemsTextColor = Colors.grey,
//     this.suffix = "",
//     required this.initialValue,
//   }) : assert(minValue < maxValue);

//   @override
//   _HorizontalPickerState createState() => _HorizontalPickerState();
// }

// class _HorizontalPickerState extends State<HorizontalPicker> {
//   late FixedExtentScrollController _scrollController;
//   List<double> items = [];

//   @override
//   void initState() {
//     super.initState();

//     _scrollController =
//         FixedExtentScrollController(initialItem: widget.initialValue);
//   }

//   double _height = 100;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: _height,
//       alignment: Alignment.center,
//       child: Scaffold(
//         backgroundColor: widget.backgroundColor,
//         body: Stack(
//           children: <Widget>[
//             Transform.translate(
//               offset: Offset(0, -_height / 2),
//               child: CustomPaint(
//                 size: Size.infinite,
//                 painter: ArcPainter(startAngle: 40, sweepAngle: 140),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(0, _height / 1.7),
//               child: CustomPaint(
//                 size: Size(Dimens.width100, Dimens.width100),
//                 painter: ArcPainter(startAngle: 40, sweepAngle: 140),
//               ),
//             ),
//             RotatedBox(
//               quarterTurns: 3,
//               child: ListWheelScrollView.useDelegate(
//                   clipBehavior: Clip.none,
//                   controller: _scrollController,
//                   itemExtent: 50,
//                   onSelectedItemChanged: (item) {},
//                   diameterRatio: 12,
//                   offAxisFraction: 20,
//                   renderChildrenOutsideViewport: true,
//                   childDelegate: ListWheelChildBuilderDelegate(
//                       childCount: widget.maxValue - widget.minValue,
//                       builder: (context, index) {
//                         return RotatedBox(
//                             quarterTurns: 1,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   color: AppTheme.textBlackColor,
//                                   width: 1,
//                                   height: 20,
//                                 ),
//                                 SizedBox(
//                                   height: Dimens.padding,
//                                 ),
//                                 Text(index.toString()),
//                               ],
//                             ));
//                       })),
//             ),
//             Visibility(
//               visible: widget.showCursor,
//               child: Container(
//                 alignment: Alignment.center,
//                 // padding: const EdgeInsets.all(5),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       color: widget.cursorColor.withOpacity(0.3)),
//                   width: 3,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
