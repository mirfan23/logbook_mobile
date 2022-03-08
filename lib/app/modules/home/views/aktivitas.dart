import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/home/controllers/home_controller.dart';

import '../../values/colors.dart';

class AktivitasBody extends GetView<HomeController> {
  const AktivitasBody({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: deviceWidth,
      child: Row(
        children: [
          Text("Aktivitas",
              style: TextStyle(color: MyColors.darkGrey, fontSize: 18)),
          SizedBox(
            width: 8.0,
          ),
          Obx(() {
            final listData = controller
                .getByDate(controller.formatDate(controller.selectedDay.value));
            return Text(listData.length.toString(),
                style: TextStyle(
                    color: MyColors.amber,
                    fontWeight: FontWeight.w500,
                    fontSize: 18));
          })
        ],
      ),
    );
  }
}
