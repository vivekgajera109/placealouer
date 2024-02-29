import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/controller/chat_controller/chat_controller.dart';

Card commonClendar({required ChatController chatController}) {
  return Card(
    color: calendarColor,
    child: CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        calendarType: CalendarDatePicker2Type.multi,
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
      onValueChanged: (dates) =>
          chatController.rangeDatePickerValueWithDefaultValue.value = dates,
    ),
  );
}
