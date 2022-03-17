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
      width: deviceWidth,
      child: Row(
        children: [
          Text("Aktivitas",
              style: TextStyle(color: MyColors.darkGrey, fontSize: 18)),
          SizedBox(
            width: 8.0,
          ),
          controller.obx((data) {
            return Text(data!.length.toString(),
                style: TextStyle(
                  color: MyColors.amber,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ));
          })
        ],
      ),
    );
  }
}
