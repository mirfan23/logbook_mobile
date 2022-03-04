// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:logbook_mobile_app/app/modules/home/views/list_body_view.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/helper.dart';
import '../../values/colors.dart';
import '../controllers/home_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aktivitas.dart';

class BulanView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShowCalendar(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  AktivitasBody(deviceWidth: deviceWidth),
                  SizedBox(
                    height: 20,
                  ),
                  Aktivitas(
                    deviceWidth: deviceWidth,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowCalendar extends StatefulWidget {
  const ShowCalendar({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowCalendar> createState() => _ShowCalendarState();
}

class _ShowCalendarState extends State<ShowCalendar> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: controller.firstDate,
      lastDay: controller.lastDate,
      calendarFormat: controller.calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(controller.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(controller.selectedDay, focusedDay)) {
          setState(() {
            controller.selectedDay = selectedDay;
            controller.focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (controller.calendarFormat != format) {
          setState(() {
            controller.calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        controller.focusedDay = focusedDay;
      },
    );
  }
}
