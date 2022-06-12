import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mh_logistik/core/utils/dimens.dart';

class DatePicker extends StatelessWidget {
  final DateTime initialDate;
  final Function(DateTime) onSelectionChanged;

  const DatePicker(
      {Key? key, required this.initialDate, required this.onSelectionChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.width100,
      height: Dimens.height35,
      child: CupertinoDatePicker(
        initialDateTime: initialDate,
        onDateTimeChanged: onSelectionChanged,
        minimumDate: DateTime(DateTime.now().year - 100),
        maximumDate: DateTime.now(),
        backgroundColor: Colors.transparent,
        dateOrder: DatePickerDateOrder.mdy,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}

// class DatePicker extends StatefulWidget {
//   final DateTime initialDate;
//   final Function(DateTime) onSelectionChanged;
//   DatePicker(
//       {Key? key, required this.initialDate, required this.onSelectionChanged})
//       : super(key: key);

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   late Rx<DateTime> dateTime;
//   late Rx<int> day;
//   late Rx<int> month;
//   late Rx<int> year;
//   late Rx<bool> isValid;

//   @override
//   void initState() {
//     super.initState();

//     dateTime = Rx<DateTime>(widget.initialDate);
//     day = Rx<int>(widget.initialDate.day);
//     month = Rx<int>(widget.initialDate.month);
//     year = Rx<int>(widget.initialDate.year);
//     isValid = Rx<bool>(true);
//   }

//   final months = [
//     TranslateTextOf.lblJanuary.tr,
//     TranslateTextOf.lblFebruary.tr,
//     TranslateTextOf.lblMarch.tr,
//     TranslateTextOf.lblApril.tr,
//     TranslateTextOf.lblMay.tr,
//     TranslateTextOf.lblJune.tr,
//     TranslateTextOf.lblJuly.tr,
//     TranslateTextOf.lblAugust.tr,
//     TranslateTextOf.lblSeptember.tr,
//     TranslateTextOf.lblOctober.tr,
//     TranslateTextOf.lblNovember.tr,
//     TranslateTextOf.lblDecember.tr,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: Dimens.width80,
//       height: Dimens.height35,
//       child: Column(
//         children: [
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: PickerCustom(
//                     itemExtent: 40,
//                     initailItem: widget.initialDate.month,
//                     itemsLength: 12,
//                     showBorders: false,
//                     looping: true,
//                     startFrom: 1,
//                     children: List.generate(
//                         12,
//                         (index) => Text(months[index],
//                             style:
//                                 Theme.of(context).textTheme.headline5?.copyWith(
//                                       color: AppTheme.textBlackColor,
//                                     ))),
//                     textStyle: Theme.of(context).textTheme.headline5?.copyWith(
//                         color: AppTheme.textBlackColor,
//                         fontWeight: FontWeight.w400),
//                     onSelectedItemChanged: (int m) {
//                       this.month.value = m;
//                       this.day.value = this.day.value;

                     

//                       final isValid = isValidDate(
//                           day: day.value, month: month.value, year: year.value);

//                       this.isValid.value = isValid;

//                       if (isValid) {
//                         widget.onSelectionChanged(
//                             DateTime(year.value, month.value, day.value));
//                       }
//                     },
//                   ),
//                 ),
//                 Text("\t\t"),
//                 Expanded(
//                   child: PickerCustom(
//                     itemExtent: 40,
//                     initailItem: widget.initialDate.day,
//                     itemsLength: _daysInMonth(month.value, year.value),
//                     startFrom: 1,
//                     looping: true,
//                     showBorders: true,
//                     textStyle: Theme.of(context).textTheme.headline5?.copyWith(
//                           color: AppTheme.textBlackColor,
//                         ),
//                     onSelectedItemChanged: (int d) {
//                       this.day.value = d;
//                       // dateTime.value = DateTime(
//                       //   dateTime.value.year,
//                       //   dateTime.value.month,
//                       // );
//                       final isValid = isValidDate(
//                           day: day.value, month: month.value, year: year.value);

//                       this.isValid.value = isValid;

//                       if (isValid) {
//                         widget.onSelectionChanged(
//                             DateTime(year.value, month.value, day.value));
//                       }
//                     },
//                   ),
//                 ),
//                 Text("\t\t"),
//                 Expanded(
//                   flex: 2,
//                   child: PickerCustom(
//                     itemExtent: 40,
//                     initailItem: widget.initialDate.year,
//                     itemsLength: 101,
//                     startFrom: DateTime.now().year - 100,
//                     showBorders: true,
//                     looping: true,
//                     onSelectedItemChanged: (int y) {
//                       this.year.value = y;
//                       // dateTime.value = DateTime(
//                       //   year,
//                       //   dateTime.value.month,
//                       // );

//                       final isValid = isValidDate(
//                           day: day.value, month: month.value, year: year.value);

//                       this.isValid.value = isValid;

//                       if (isValid) {
//                         widget.onSelectionChanged(
//                             DateTime(year.value, month.value, day.value));
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(width: Dimens.paddingLarge),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   bool isValidDate({required int month, required int day, required int year}) {
//     final int daysInMonth = _daysInMonth(month, year);

//     logger.d("Isvalid = ${day <= daysInMonth}");

//     return day <= daysInMonth;

//     // if (month == DateTime.january ||
//     //     month == DateTime.march ||
//     //     month == DateTime.may ||
//     //     month == DateTime.july ||
//     //     month == DateTime.august ||
//     //     month == DateTime.october ||
//     //     month == DateTime.december) {

//     //   return day <= daysInMonth;

//     // } else if (month == DateTime.april ||
//     //     month == DateTime.june ||
//     //     month == DateTime.september ||
//     //     month == DateTime.november) {
//     //   return day <= daysInMonth;
//     // }
//     // else {
//     //   // Handle feburary case
//     //   if (leapYear(year)){
//     //     return day <= 29;
//     //   }

//     //   return day <= 28;
//     // }
//   }

//   int _daysInMonth(final int monthNum, final int year) {
//     assert(monthNum <= 12);

//     final List<int> monthLength = List.filled(12, 0);
//     monthLength[0] = 31;
//     monthLength[2] = 31;
//     monthLength[4] = 31;
//     monthLength[6] = 31;
//     monthLength[7] = 31;
//     monthLength[9] = 31;
//     monthLength[11] = 31;
//     monthLength[3] = 30;
//     monthLength[8] = 30;
//     monthLength[5] = 30;
//     monthLength[10] = 30;

//     if (leapYear(year) == true)
//       monthLength[1] = 29;
//     else
//       monthLength[1] = 28;

//     return monthLength[monthNum - 1];
//   }

//   bool leapYear(int year) {
//     bool leapYear = false;
//     final bool leap = ((year % 100 == 0) && (year % 400 != 0));
//     if (leap == true)
//       leapYear = false;
//     else if (year % 4 == 0) leapYear = true;

//     return leapYear;
//   }
// }
