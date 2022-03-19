import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';
import 'package:logbook_mobile_app/app/utils/helper.dart';

import '../../values/colors.dart';

class DetailBody extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: MyColors.white2),
          child: Checkbox(
            onChanged: (_) {},
            side: BorderSide(style: BorderStyle.none),
            value: false,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: controller.obx(
              (_) => TextField(
                    controller: controller.judulcontroller,
                    decoration: InputDecoration(
                        hintText: "Judul",
                        hintStyle: TextStyle(color: MyColors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        filled: true,
                        fillColor: MyColors.white2,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none)),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
              onLoading: WidgetLoading(height: 50)),
        )
      ],
    );
  }
}
