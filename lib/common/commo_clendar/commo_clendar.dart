import 'dart:developer';

import "package:intl/intl.dart";
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/controller/select_car_controller/select_car_controller.dart';

StatefulWidget commonClendar(
    {required SelectCarController chatController,
    required void Function(void Function()) setState1}) {
  return StatefulBuilder(builder: (context, setState) {
    return Card(
      color: calendarColor,
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.range,
          selectedDayHighlightColor: blueColor,
          disabledDayTextStyle: const TextStyle(
            color: hintTextColor,
            fontWeight: FontWeight.w500,
          ),
          lastMonthIcon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: appWhiteColor,
          ),
          yearTextStyle: const TextStyle(
            color: appWhiteColor,
            fontWeight: FontWeight.w500,
          ),
          todayTextStyle: const TextStyle(
            color: appWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          nextMonthIcon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: appWhiteColor,
          ),
          dayTextStyle: const TextStyle(
            color: appWhiteColor,
            fontWeight: FontWeight.w500,
          ),
          weekdayLabelTextStyle: const TextStyle(
            color: appWhiteColor,
            fontWeight: FontWeight.bold,
          ),
          currentDate: DateTime.now(),
          firstDate: DateTime.now(),
          controlsTextStyle: const TextStyle(
            color: appWhiteColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          selectedDayTextStyle: const TextStyle(
            color: appWhiteColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: chatController.rangeDatePickerValueWithDefaultValue,
        onValueChanged: (dates) {
          chatController.rangeDatePickerValueWithDefaultValue.value = dates;
          chatController.firstDateController.value.text =
              DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(dates[0].toString()));
          chatController.firstDate = DateTime.parse(dates[0].toString());
          chatController.lastDate = DateTime.parse(dates.last.toString());
          chatController.lastDateController.value.text =
              DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(dates.last.toString()));
          chatController.setDateRange();

          setState(() {});
          setState1(() {});
        },
      ),
    );
  });
}

List<DateTime> generateDateRange(DateTime startDate, DateTime endDate) {
  List<DateTime> dateRange = [];
  DateTime currentDate = startDate;

  while (
      currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dateRange.add(currentDate);
    currentDate = currentDate.add(const Duration(days: 1));
  }
  log("------>> ${dateRange.length}");
  return dateRange;
}
